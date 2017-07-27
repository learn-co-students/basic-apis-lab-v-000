class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '22783364cd7962bd7889'
      req.params['client_secret'] = '78b8d43629e5d708f34c672b14864c242ed8f402'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end
 
end
