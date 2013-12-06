# encoding: utf-8
class CarsController < ApplicationController
  load_and_authorize_resource
  def index
    page = params[:page]
    @cars = Car.page(page)
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
      format.json { render json: @cars }
    end
  end

  def show
    @car = Car.find(params[:id])
    @title = @car.name

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @car }
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    respond_to do |format|
      if @car.update_attributes(params[:car])
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end


end
