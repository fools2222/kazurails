class HomesController < ApplicationController
    def index 
    end
    def create 
        @board = Board.new(board_params)
        @board.save
        redirect_to  home_path
    end
    def show
    end
    def new 
        @board = Board.new(params[:id])
    end
    private 
    def board_params
        params.require(:board).permit(:name,:title,:body)
    end
end
