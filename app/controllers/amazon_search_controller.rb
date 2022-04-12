class AmazonSearchController < ApplicationController
    def index
        @amazon = AmazonSearch.all
    end
    def new
        @amazon = AmazonSearch.all
        @list = $list
    end
    def run
        @scraype = AmazonSearch.new
        @scraype.run
        render :new
    end
end
