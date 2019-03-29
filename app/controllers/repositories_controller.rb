class RepositoriesController < ApplicationController

  def search
  end

  def github_search

    id = "c97378bd880bf5ed4f8e"
    secret = "27aad4b35838be30e138e21be32058fcfc6971cb"

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = id
      req.params['client_secret'] = secret
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @search_results = body_hash["items"]
    render 'search'
  end
end
