class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ""
      req.params['client_secret'] = ""
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@response.body)
    @results = body_hash['items']
    render 'search'
  end
end
