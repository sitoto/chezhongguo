class QuestionsController < ApplicationController
  load_and_authorize_resource :only => [:new, :edit, :update, :destroy, :my]

  def index
    @questions = Question.all.desc(:created_at)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  def node
    page = params[:page]
    @node = Node.find(params[:id])
    @questions = @node.questions.last_actived.fields_for_list.include(:user).page(page)
  end

  def show
    @question = Question.find(params[:id])
    @question.inc(views_count: 1)
    @node = @question.node
    @page_title = @question.title

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = Question.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end


  def search
    @questions = Question.all.desc(:created_at)

    respond_to do |format|
      format.html
    end
  end

  def tags
    respond_to do |format|
      format.html
    end
  end

  def experts
    respond_to do |format|
      format.html
    end
  end

  def unanswered
    respond_to do |format|
      format.html
    end
  end

  def my 
    respond_to do |format|
      format.html
    end
  end

  def question_params
    params.require(:question).permit(:node_id, :title, :content)
  end


end
