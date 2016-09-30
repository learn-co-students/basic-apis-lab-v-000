class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'c7b9222fc1d7153e1770'
      req.params['client_secret'] = '7eaeb66c7fa6194b1782fafc882598d586688baf'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]


    render 'search'

#name, link to repository, description
  end
end

#["items"][2]["owner"]["login"]
#@items.each do |item| 
#item["owner"]["login"]
