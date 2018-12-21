class RepositoriesController < ApplicationController

  def search

  end
  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'e3590f5e7c619934ca0b'
      req.params['client_secret'] = '5cd4bae7ec5ad7432004eace3bcbf581eb2849b9'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end
end
