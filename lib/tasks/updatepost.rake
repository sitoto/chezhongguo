desc "Fetch product menu"
task :update_posts => :environment do
  @topics = Topic.all #where(url: /16966356-1/)
   @topics.all.each do |topic|
      puts url = topic.url
      posts = []
      topic.posts.each do |post|

        post.content.gsub!(/http:\/\/club\d\.autoimg\.cn\/album\/userphotos\/\d*\/\d*\/\d*\//,"/system/newimages/")
        post.content.gsub!(/http:\/\/www\.autoimg\.cn\/album\/userphotos\/\d*\/\d*\/\d*\//,"/system/newimages/")
        post.content.gsub!(/http:\/\/www\.autoimg\.cn\/album\/\d*\/\d*\/\d*\//,"/system/newimages/")

#http://www.autoimg.cn/album/userphotos/2012/9/15/500_e44e_634fbb03_634fbb03.jpg?689
        post.content.gsub!('src="http://x.autoimg.cn/club/lazyload.png"',"")
        post.content.gsub!('src9',"src")
        post.content.gsub!('onload="tz.picLoaded(this)"',"")
        post.content.gsub!('onerror="tz.picNotFind(this)"',"")
	posts << post
      end
      puts "save topic"
	topic.posts = posts
      topic.save
  end #end of topic
end
