class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "e9a28dc7f54977a68cd1"
      req.params['client_secret'] = "91f4c597a4a65c08c5c27c2b258c0c2e0fad2167"
      req.params['q'] = params[:query]
    end

    @body_hash = JSON.parse(@resp.body)

    render 'search'
  end

end
