class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    #  req.params['client_id'] = '610d2aa64e849eb2bf34'
    #  req.params['client_secret'] = '71300a568145e34736f3ad22c18c1e43471fceeb'
      req.params['q'] = params[:query]
    #  req.params['sort'] = 'stars'
    #  req.params['order'] = 'desc'
    end

    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end
end
