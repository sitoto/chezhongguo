# encoding: utf-8
class Admin::QuestionsController < Admin::ApplicationController

  # GET /admin/questions
  def index
    page = params[:page]
    @admin_questions = Question.page(page)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /admin/questions/1
  def show
    @admin_question = Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /admin/questions/new
  def new
    @admin_question = Question.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /admin/questions/1/edit
  def edit
    @admin_question = Question.find(params[:id])
  end

  # POST /admin/questions
  def create
    pq = params[:question]
    
    @admin_question = Question.new(pq)
    @admin_question.user_id = current_user.id
    @admin_question.node_id = params[:node] || pt[:node_id]

    respond_to do |format|
      if @admin_question.save
        format.html { redirect_to [:admin, @admin_question], notice: 'Question was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /admin/questions/1
  def update
    @admin_question = Question.find(params[:id])

    pt = params[:question]
    @admin_question.user_id = current_user.id
    @admin_question.node_id = params[:node] || pt[:node_id]


    respond_to do |format|
      if @admin_question.update_attributes(params[:question])
        format.html { redirect_to [:admin, @admin_question], notice: 'Question was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /admin/questions/1
  def destroy
    @admin_question = Question.find(params[:id])
    @admin_question.destroy

    respond_to do |format|
      format.html { redirect_to admin_questions_url }
    end
  end
end
