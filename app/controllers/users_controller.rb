class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end
  def create
    if @user.save
      
    else
      render :new 
    end
  end
  def show 
    @user = User.find(params[:id])
  end
end
