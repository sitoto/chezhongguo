# encoding: utf-8
class BrandsController < ApplicationController

  def index
   @brands_hot = Brand.desc("hot_index").limit(20)
   @brands = Brand.all
    @brands_zz = []
    @brands_dx = []
    @brands_rh = []
    @brands_mx = []
    @brands_ox = []
    @brands_qt = []

    @brands.each do |brand|
      case brand.class_tag
      when "自主品牌" 
        @brands_zz << brand
      when "德系品牌"
        @brands_dx << brand
      when "日韩品牌"
        @brands_rh << brand
      when "美系品牌"
        @brands_mx << brand
      when "欧系品牌"
        @brands_ox << brand
      else
        @brands_qt << brand

      end
    end

    @page_title = "品牌大全"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brands }
    end
  end

  # GET /brands/1.json
  def show
    @brand = Brand.find(params[:id])
    #@makers = @brand.makers
    @page_title = @brand.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

end
