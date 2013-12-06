# encoding: utf-8
class Admin::HomeController < Admin::ApplicationController
  def index
    @title = "admin首页"
  end
end
