class HomesController < ApplicationController
 

 
    def index 
    end
    def new 
        @board = Board.new
    end
    
    
end
