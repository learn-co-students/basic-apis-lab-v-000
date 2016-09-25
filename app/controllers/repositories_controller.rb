class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |request|
      request.params["q"] = params[:query]
    end
    @body_hash = JSON.parse(@response.body)
    render 'search' 
  end
end
