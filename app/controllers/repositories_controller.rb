class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.7262b7f9e35c6af2'
      req.params['client_secret'] = 'cfd34650b4027deae57fafa522f62f582678fbce'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @items = body["items"]
    render 'search'
      
  
  end
end
