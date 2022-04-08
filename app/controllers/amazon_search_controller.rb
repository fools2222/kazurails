class AmazonSearchController < ApplicationController
    def index
        @amazon = AmazonSearch.all
    end
    def new
        @amazon = AmazonSearch.last(10)
        scraype = Scraype.new
        @sec = scraype.sec
    end
    def show 
        @amazon = AmazonSearch.first(10)
    end
end
