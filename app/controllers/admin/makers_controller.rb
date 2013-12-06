class Admin::MakersController < Admin::ApplicationController



  # GET /admin/makers
  # GET /admin/makers.json
  def index
    @admin_makers = Maker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_makers }
    end
  end

  # GET /admin/makers/1
  # GET /admin/makers/1.json
  def show
    @admin_maker = Maker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_maker }
    end
  end

  # GET /admin/makers/new
  # GET /admin/makers/new.json
  def new
    @admin_maker = Maker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_maker }
    end
  end

  # GET /admin/makers/1/edit
  def edit
    @admin_maker = Maker.find(params[:id])
  end

  # POST /admin/makers
  # POST /admin/makers.json
  def create
    @brand  = Brand.find(params[:brand_id])
    @maker = @brand.makers.build(params[:maker])


    respond_to do |format|
      if @maker.save
        format.html { redirect_to [:admin, @brand], notice: 'Maker was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /admin/makers/1
  # PUT /admin/makers/1.json
  def update
    @admin_maker = Maker.find(params[:id])

    respond_to do |format|
      if @admin_maker.update_attributes(params[:maker])
        format.html { redirect_to [:admin, @admin_maker], notice: 'Maker was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /admin/makers/1
  # DELETE /admin/makers/1.json
  def destroy
    @admin_maker = Maker.find(params[:id])
    @admin_maker.destroy

    respond_to do |format|
      format.html { redirect_to admin_makers_url }
    end
  end
end
