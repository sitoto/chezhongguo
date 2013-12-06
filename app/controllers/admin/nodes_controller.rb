# encoding: utf-8
class Admin::NodesController < Admin::ApplicationController
  # GET /admin/nodes
  # GET /admin/nodes.json
  def index
    @admin_nodes = Node.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_nodes }
    end
  end

  # GET /admin/nodes/1
  # GET /admin/nodes/1.json
  def show
    @admin_node = Node.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_node }
    end
  end

  # GET /admin/nodes/new
  # GET /admin/nodes/new.json
  def new
    @admin_node = Node.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_node }
    end
  end

  # GET /admin/nodes/1/edit
  def edit
    @admin_node = Node.find(params[:id])
  end

  # POST /admin/nodes
  # POST /admin/nodes.json
  def create
    @admin_node = Node.new(params[:node])

    respond_to do |format|
      if @admin_node.save
        format.html { redirect_to [:admin, @admin_node], notice: 'Node was successfully created.' }
        format.json { render json:[:admin, @admin_node], status: :created, location: @admin_node }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/nodes/1
  # PUT /admin/nodes/1.json
  def update
    @admin_node = Node.find(params[:id])

    respond_to do |format|
      if @admin_node.update_attributes(params[:node])
        format.html { redirect_to [:admin, @admin_node], notice: 'Node was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/nodes/1
  # DELETE /admin/nodes/1.json
  def destroy
    @admin_node = Node.find(params[:id])
    @admin_node.destroy

    respond_to do |format|
      format.html { redirect_to admin_nodes_url }
      format.json { head :no_content }
    end
  end
end
