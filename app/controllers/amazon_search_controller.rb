class AmazonSearchController < ApplicationController
    def index
        @amazon = AmazonSearch.all
    end
    def new
        @amazon = AmazonSearch.new
    end
end
