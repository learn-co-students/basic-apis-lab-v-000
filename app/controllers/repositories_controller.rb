class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |r|
      r.params['q'] = params[:query]
    end

    json_response = JSON.parse(@response.body)
    if @response.success?
      @repos = json_response["items"]
    else
      @error = json_response["message"]
    end
    render 'search'
  end
end
