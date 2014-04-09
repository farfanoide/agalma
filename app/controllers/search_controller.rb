class SearchController < ApplicationController
  
  def index
    @search = Sunspot.search(Post,Branch) do |s|
      s.fulltext(params[:search])
    end
    @results = @search.results
  end
end
