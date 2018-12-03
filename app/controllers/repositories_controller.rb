class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "Iv1.8c5324efe6a1ba0e"
      req.params['clinet_secret'] = "fcc32e1c27ee805db74378293330c73b2a94ec85"
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
