class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6a4150d680a4a572e048'
      req.params['client-secret'] = 'b6b3c2fa3705dfa00f4616f1e3369bc66629f9b2'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
