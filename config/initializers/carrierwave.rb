# encoding: utf-8
CarrierWave.configure do |config|
#  config.grid_fs_database = Mongoid::Config.sessions[:default][:database]
#  config.grid_fs_host = Mongoid::Config.sessions[:default][:hosts].first
  config.storage = :grid_fs # 存储类型
  config.grid_fs_access_url = "/images"
#  config.grid_fs_database = "photos" #Mongoid.database.name # GridFS数据库名
#  config.grid_fs_host = "127.0.0.1" #Mongoid.config.master.connection.host # GridFS服务器地址


  end
=begin
CarrierWave.configure do |config|
  config.grid_fs_database = 'photos'
  config.grid_fs_port = 27017
  config.grid_fs_host = '127.0.0.1'
  config.grid_fs_username = ''
  config.grid_fs_password = ''

  config.storage = :grid_fs
  config.root = Rails.root.join('tmp')
  config.cache_dir = "uploads"
end
=end
