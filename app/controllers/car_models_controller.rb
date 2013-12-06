# encoding: utf-8
class CarModelsController < ApplicationController
  # GET /car_models
  # GET /car_models.json
  def index
    page = params[:page]
    @car_models = CarModel.page(page)
    @page_title = "全部车型"
    
    @brands = Brand.all.desc("hot_index")
    @brands_hot = @brands.hot_brands 

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


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @car_models }
    end
  end

  # GET /car_models/1
  # GET /car_models/1.json
  def show
    @car_model = CarModel.find(params[:id])
    @title = @car_model.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car_model }
    end
  end
end
