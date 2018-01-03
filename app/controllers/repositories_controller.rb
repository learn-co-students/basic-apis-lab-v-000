class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '3c2fa157ffaedab4ff39'
      req.params['client_secret'] = '70267b30c3b0c8f0aea1c3f25529a8eb1eacfa71'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    
    @items = body["items"]

    render 'search'
  end

end
