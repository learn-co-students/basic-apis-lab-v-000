class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = '662e7af3e9ff72941240'
      req.params['client_secret'] = '2f1e694a6c4257ad6968456b4ec91ddd475dd96a'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
