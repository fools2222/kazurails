class AmazonSearchController < ApplicationController
    def index
        @amazon = AmazonSearch.all
    end
    def new
        @amazon = AmazonSearch.last(10)
    end
    def run
        @scraype = AmazonSearch.sec
        render :new
    end
end
