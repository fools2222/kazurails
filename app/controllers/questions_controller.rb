class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def new 
    @question = Question.new
  end
  def create 
    @question = Question.new(q_params)
    if @question.save 
      redirect_to root_path,notice:"保存しました！！"

    else
      flash[:alart] = "失敗！"
      render :new
    end
  end

  def edit 
   @question = Question.find(params[:id])
  end

  def update 
    @question = Question.find(params[:id])
    if @question.update(q_params)
      redirect_to root_path,notice:"変更しました"
    else
      flash[:alert] = "失敗しました"
      render :edit
    end
  end

  def destroy 
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to root_path,notice:"削除しました"
    end
  end

  def show 
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  private
  def q_params 
    params.require(:question).permit(:name,:title,:content)
  end
end
