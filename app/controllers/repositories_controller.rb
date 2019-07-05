class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'bca24975b7c654111711'
      req.params['client_secret'] = 'b2a05bc1c3ef65c379277a0eb98a1980845c370b'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    # binding.pry
    @repos = body_hash["items"]

    render 'search'
  end
end
