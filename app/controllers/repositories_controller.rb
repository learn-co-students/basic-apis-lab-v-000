class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params[:q] = params[:query]
      req.params[:client_id] = '653c4c474c057fa03623'
      req.params[:client_secret] = '7d592224ee90e7e218ef7213146d3d1d031687b1'
    end
    body = JSON.parse(@resp.body)
    @items = body["items"]
    render 'search'
  end
end
