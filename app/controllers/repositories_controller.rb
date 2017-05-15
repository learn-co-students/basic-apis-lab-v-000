class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params[:client_id] = '8db3f357fc65f9d6b6cd'
      req.params[:client_secret] = '441194c012a4e9742b5c2e43d126b438e359125b'
      req.params[:q] = params[:query]
    end

    body_hash = JSON.parse(resp.body)
    @items = body_hash['items']

    render 'search'
  end
end
