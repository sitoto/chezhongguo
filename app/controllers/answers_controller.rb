#encoding: UTF-8
class AnswersController < ApplicationController
   def create
    @question = Question.find(params[:question_id])
    @question.inc(:answers_count, 1)
    @answer = @question.answers.new(params[:answer])
    @answer.user = current_user
    @answer.save

    redirect_to @question, :notice => "回答成功!"
  end

  def destory
  end
end
