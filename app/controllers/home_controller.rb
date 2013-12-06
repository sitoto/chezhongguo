# encoding: utf-8
class HomeController < ApplicationController
  def index
    @title = "首页"
    @users = User.all
  end
end
