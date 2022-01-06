class MainpagesController < ApplicationController
  def inde
    @questions = Question.all
  end
end
