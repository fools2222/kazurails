class AmazonSearchController < ApplicationController
   require "selenium-webdriver"
    def index
        @amazon = AmazonSearch.all
    end
    def new
       @amazon = AmazonSearch.new
       @sec = @amazon.sec
    end
    def show
        @amazon = AmazonSearch.find(params[:id])
    end
    


end
