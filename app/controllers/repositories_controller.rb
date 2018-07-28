class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'Iv1.8abf286bb703c330'
    client_secret = 'a02c8a0fa58162a0e6b8812e00df903556689d69'
    
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body['items']
    render :search
  end
end
