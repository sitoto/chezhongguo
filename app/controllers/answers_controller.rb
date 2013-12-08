#encoding: UTF-8
class AnswersController < ApplicationController

   def create
    @question = Question.find(params[:question_id])
    @question.inc(answers_count: 1)
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user
    @answer.save

    redirect_to @question, :notice => "回答成功!"
  end

  def destory
  end

  def answer_params
    params.require(:answer).permit(:content, :level, :good, :bad)
  end
end
