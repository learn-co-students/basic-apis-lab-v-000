class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp =  Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '3e33210c44bf010f9b34'
      req.params['client_secret'] = 'dbb4d688d7693ad3159f651d3c8793aec198e181'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end

