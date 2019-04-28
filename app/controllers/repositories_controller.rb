class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    query = params[:query]
    url = "https://api.github.com/search/repositories"
    @response = Faraday.get url  do | headers |
       headers.params["q"] = "#{query}"
       headers.params["order"] = "asc"
       headers['client_id'] = 'e614d0f9652484ef0981'
       headers['client_secret'] ='fac085de559ea50c363bb4f7d023a144f9305ff5'
    end
    @items = JSON.parse( @response.body )["items"]
    render 'search'
  end
end
