class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "30ecbb7e47641001d5dd"
      req.params['client_secret'] = "f3153e0fc7574dbf107262d9229c6dc7ae9b770c"
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@response.body)
    @results = body_hash['items']
    render 'search'
  end


end
