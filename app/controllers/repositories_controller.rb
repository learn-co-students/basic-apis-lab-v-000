class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'fe5e6604a7a61e920cca'
      req.params['client_secret'] = 'b1163f48266920052f81e0fd237d1fa2f95f07cb'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'
  end

end
