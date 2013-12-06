class AutopartsController < ApplicationController
  # GET /autoparts
  # GET /autoparts.json
  def index
    @autoparts = Autopart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @autoparts }
    end
  end

  # GET /autoparts/1
  # GET /autoparts/1.json
  def show
    @autopart = Autopart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @autopart }
    end
  end

  # GET /autoparts/new
  # GET /autoparts/new.json
  def new
    @autopart = Autopart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @autopart }
    end
  end

  # GET /autoparts/1/edit
  def edit
    @autopart = Autopart.find(params[:id])
  end

  # POST /autoparts
  # POST /autoparts.json
  def create
    @autopart = Autopart.new(params[:autopart])

    respond_to do |format|
      if @autopart.save
        format.html { redirect_to @autopart, notice: 'Autopart was successfully created.' }
        format.json { render json: @autopart, status: :created, location: @autopart }
      else
        format.html { render action: "new" }
        format.json { render json: @autopart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /autoparts/1
  # PUT /autoparts/1.json
  def update
    @autopart = Autopart.find(params[:id])

    respond_to do |format|
      if @autopart.update_attributes(params[:autopart])
        format.html { redirect_to @autopart, notice: 'Autopart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @autopart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /autoparts/1
  # DELETE /autoparts/1.json
  def destroy
    @autopart = Autopart.find(params[:id])
    @autopart.destroy

    respond_to do |format|
      format.html { redirect_to autoparts_url }
      format.json { head :no_content }
    end
  end
end
