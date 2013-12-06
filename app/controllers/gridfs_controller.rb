require 'mongo'

class GridfsController < ActionController::Metal
  def serve
    gridfs_path = env["PATH_INFO"].gsub("/images/", "")
    begin
      host = "211.101.12.237" 
      database = "chezhongguo_development"

      db = Mongo::DB.new(database , Mongo::Connection.new(host))
      gridfs_file = Mongo::GridFileSystem.new(db).open(gridfs_path, 'r')
      self.response_body = gridfs_file.read
      self.content_type = gridfs_file.content_type
      puts  gridfs_file.content_type

    rescue Exception => e
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = ''
      raise e
    end
  end
end
