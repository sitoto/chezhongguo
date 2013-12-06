# encoding: utf-8
class Admin::BrandsController < Admin::ApplicationController
  # GET /admin/brands
  # GET /admin/brands.json
  def index
    page = params[:page]
    @brands = Brand.page(page)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brands }
    end
  end

  # GET /admin/brands/1
  # GET /admin/brands/1.json
  def show
    @brand = Brand.find(params[:id])
    @makers = @brand.makers

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brand }
    end
  end

  # GET /admin/brands/new
  # GET /admin/brands/new.json
  def new
    @brand = Brand.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /admin/brands/1/edit
  def edit
    @brand = Brand.find(params[:id])
  end

  # POST /admin/brands
  # POST /admin/brands.json
  def create
    @brand = Brand.new(params[:brand])

    respond_to do |format|
      if @brand.save
        format.html { redirect_to [:admin, @brand], notice: 'Brand was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /admin/brands/1
  # PUT /admin/brands/1.json
  def update
    @brand = Brand.find(params[:id])

    respond_to do |format|
      if @brand.update_attributes(params[:brand])
        format.html { redirect_to [:admin, @brand], notice: 'Brand was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /admin/brands/1
  # DELETE /admin/brands/1.json
  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to admin_brands_url }
    end
  end
end
