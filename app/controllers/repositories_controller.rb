class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "Iv1.97002a56b7dcc612"
        req.params['client_secret'] = "0b4d687085799980443dea0bbf38603da5ef4530"
        req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
