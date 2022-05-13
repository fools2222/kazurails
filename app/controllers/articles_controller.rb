class ArticlesController < ApplicationController
  def index
    @articles = view_context.contentful.entries(content_type: 'kazutter')
    
  end

  def show
    @article = view_context.contentful.entry(params[:id])
  end
end
