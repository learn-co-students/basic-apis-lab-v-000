class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6edc5827b4b4bafb2a15'
      req.params['client_secret'] = 'de2d97639b4378ec39e7270200efeedbce46de9d'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render :search
  end
end
