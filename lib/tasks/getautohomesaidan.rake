desc "Fetch product menu"
task :fetch_articles => :environment do
  require 'pp'
  require 'mongoid'
  require 'rubygems'
  require 'nokogiri'
  require_relative "common"

  include Common


  # 获取列表
  1.upto(8).each do |i|
    url = "http://y.autohome.com.cn/shaidan/?sc=0&subsc=0&city=0&order=1&ps=80&p=#{i}"
    doc = fetch_doc(url)
    next if doc.blank?
    doc.xpath('//div[@class="dcard"]').each do |item|

      puts tag = item.at_xpath('span[@class="tags"]/text()').to_s.strip
      puts burl = item.at_xpath('div[@class="noa"]/a/@href').to_s.strip

      puts title =  item.at_xpath('div[@class="nob"]/a/text()').to_s.strip
      puts click_num = item.at_xpath('div[@class="noc"]/span[1]/text()').to_s.strip
      puts post_num = item.at_xpath('div[@class="noc"]/span[2]/text()').to_s.strip

      article = Article.find_or_create_by(from_url: burl)
      article.title = title
      article.tags << tag
      article.tags.uniq!
      article.hits = click_num
      article.posts_count = post_num
      article.save

    end
  end
end

task :fetch_topics => :environment do
  require 'pp'
  require 'mongoid'
  require 'rubygems'
  require 'nokogiri'
  require_relative "common"

  include Common

  @articles  = Article.where(:status.ne => 9)
  @articles.each_with_index do |art, i|
    puts "第几篇文章: #{i}"
    topic_url = art.from_url
    doc = fetch_doc(topic_url)
    if doc.blank? 
      puts "#{art.title}-#{topic_url} - 当前文档为空，next item"
      art.status = 9
      art.save
      next
    end
    # 获取到网页数据 分析处理内容
    puts title = doc.at_xpath('//div[@id="consnav"]/span[4]/text()').to_s
    if title.blank?
      puts "页面解析错误， 下一篇文章"
      art.status = 9
      art.save
      next
    end

    puts author = doc.at_xpath('//div[@class="conleft fl"]/ul[1]/li[1]/a/text()').to_s
    puts published_at = doc.at_xpath('//span[@xname="date"][1]/text()').to_s
    puts class_name = doc.at_xpath('//a[@id="a_bbsname"]/text()').to_s
    puts page_num = doc.at_xpath('//span[@class="fs"][1]/@title').to_s.split(' ')[1]


    art.class_name = class_name  unless class_name.blank?
    art.pages_count = page_num  unless page_num.blank?
    art.status = 1
    art.save

    if art.pages_count
      max_num = art.pages_count 
    else
      max_num = 1
    end
    1.upto(max_num).each do |i|
      next_url = topic_url.gsub('-1.html', "-#{i}.html")
      topic = Topic.find_or_create_by(url: next_url)
      topic.article = art
      topic.status = 1
      topic.title = title
      topic.author = author
      topic.published_at = published_at
      topic.page_num = i

      topic.save
    end

  end
end
task :fetch_posts => :environment do
  require 'mechanize'
  require 'pp'
  require 'mongoid'
  require 'rubygems'
  require 'nokogiri'
  require_relative "common"

  include Common
  articles  = Article.where(:status => 1)
  articles.each do |article|
    ts = article.topics#.where(:status.ne => 1)

    ts.each_with_index do |topic, i|
      puts url = topic.url
      topic.posts = []
      posts = []      

      doc = fetch_doc(url)
      if doc.blank? 
        puts "#{article.title}-#{url} - 当前文档 第#{topic.page_num}页 为空，=>下一篇文章"
        topic.status = "9"
        next
      end      
      posts = []
      doc.xpath('//div[@class="clearfix contstxt"]').each_with_index do  |item, j|
        puts "j:#{j}"
        post = Post.new()
        puts  author =  item.at_xpath('div[@class="conleft fl"]/ul[1]/li[1]/a/text()').to_s.strip
        published_at = item.at_xpath('div[@class="conright fl"]/div[@class="rconten"]/div[1]/span[@xname="date"]/text()').to_s.strip
        level =  item.at_xpath('div[@class="conright fl"]/div[@class="rconten"]/div[1]/div/a[@class="rightbutlz"]/@rel').to_s.strip
        content = item.at_xpath('div//div[@xname="content"]/div[@class="w740"]').to_s

        post.author = author
        post.level = level
        post.my_level = j
        post.created_at = published_at
        content.gsub!(/http:\/\/club\d\.autoimg\.cn\/album\/userphotos\/\d*\/\d*\/\d*\//,"/newimages/")
        content.gsub!(/http:\/\/www\.autoimg\.cn\/album\/\d*\/\d*\/\d*\//,"/newimages/")

        content.gsub!('src="http://x.autoimg.cn/club/lazyload.png"',"")
        content.gsub!('src9',"src")
        content.gsub!('onload="tz.picLoaded(this)"',"")
        content.gsub!('onerror="tz.picNotFind(this)"',"")


        post.content = content

        post.page_num = topic.page_num
        posts << post
      end
      topic.posts = posts
      puts "save topic"
      topic.status = 1
      topic.save

      agent = Mechanize.new
      page = agent.get url


      #src
      page.images_with(:src => /autoimg/).each do |img|
        imgname =  img.url.to_s.split('/')[-1]
        imgname =  imgname.split('?')[0]

        filepath = "public/newimages/#{imgname}"
        if File.exist?(filepath)
          puts "exist"
        else
          begin
            img.fetch.save(filepath)
          rescue
            puts "image download error"
          end
        end
      end

      doc.xpath("//div[@class='w740']//img").each do  |img|
        if img.at_xpath("@src9")
          puts imgurl = img.at_xpath("@src9").to_s
          imgname =  imgurl.split('/')[-1]
          imgname =  imgname.split('?')[0]
          filepath = "public/newimages/#{imgname}"
          begin
            agent.get(img.at_xpath('@src9').to_s,[],  referer = "http://club.autohome.com.cn/" ).save(filepath) 
          rescue
            puts "error to open"
          end
        end

      end


    end #end of topic
  end
end
