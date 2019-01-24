class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "71528df81a70373c5175"
      req.params['client_secret'] = "d3226c81433170cb649ae776e61586a1c73367b8"
      req.params['q'] = params[:query]
    end 
    body_hash = JSON.parse(@resp.body)
    @results = body_hash['items']
    render 'search'
  end
end
