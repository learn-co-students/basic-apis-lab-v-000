class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'e2b521b35217db544794'
      req.params['client_secret'] = '63c92aa24ffbf3ba5b3bc3cf869bfc0432c5d13b
'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @items = body['items']
    render 'search'
  end


end
