class AmazonSearchController < ApplicationController
   require "selenium-webdriver"
    def index
        @amazon = AmazonSearch.all
    end
    def new
        @amazon = AmazonSearch.new
        scraype = Scraype.new
        @sec = scraype.sec
        render :index
    end
end
