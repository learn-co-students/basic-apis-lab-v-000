class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '758b243a1def203def37'
      req.params['client_secret'] = 'de6f12ac726b7109b3bcd656ec8109311f4896a8'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @rep = body_hash["items"]

    render 'search'
  end
end
