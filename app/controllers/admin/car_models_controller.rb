# encoding: utf-8
class Admin::CarModelsController < Admin::ApplicationController
  # GET /admin/car_models
  # GET /admin/car_models.json
  def index
    page = params[:page]
    @admin_car_models = CarModel.page(page)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_car_models }
    end
  end

  # GET /admin/car_models/1
  # GET /admin/car_models/1.json
  def show
    @admin_car_model = CarModel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_car_model }
    end
  end

  # GET /admin/car_models/new
  # GET /admin/car_models/new.json
  def new
    @admin_car_model = CarModel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_car_model }
    end
  end

  # GET /admin/car_models/1/edit
  def edit
    @admin_car_model = CarModel.find(params[:id])
  end

  # POST /admin/car_models
  # POST /admin/car_models.json
  def create
    @admin_car_model = CarModel.new(params[:admin_car_model])

    respond_to do |format|
      if @admin_car_model.save
        format.html { redirect_to @admin_car_model, notice: 'Car model was successfully created.' }
        format.json { render json: @admin_car_model, status: :created, location: @admin_car_model }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/car_models/1
  # PUT /admin/car_models/1.json
  def update
    @admin_car_model = CarModel.find(params[:id])

    respond_to do |format|
      if @admin_car_model.update_attributes(params[:admin_car_model])
        format.html { redirect_to @admin_car_model, notice: 'Car model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/car_models/1
  # DELETE /admin/car_models/1.json
  def destroy
    @admin_car_model = CarModel.find(params[:id])
    @admin_car_model.destroy

    respond_to do |format|
      format.html { redirect_to admin_car_models_url }
      format.json { head :no_content }
    end
  end
end
