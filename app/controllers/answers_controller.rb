class AnswersController < ApplicationController

  def create 
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question),notice:"ok"
    else
      redirect_to question_path(@question),alert:"no"
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update 
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question),notice:"変更しました"
    else
      render :edit
    end
  end

  def destroy 
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
      redirect_to question_path(@question) ,notice:"消しました"

  end

  private
  def answer_params 
    params.require(:answer).permit(:content,:name,:question_id)
  end
end
