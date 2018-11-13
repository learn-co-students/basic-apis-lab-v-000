class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a780dc5d223311af33a4'
      req.params['client_secret'] = '4cae57ceaecc10a9c9cf63b5c7592b27eb095a81'
      req.params['q'] = params[:query]
      req.options.timeout = 10000
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body['items']
    else
      @error = body['errors']['message']
    end

    render 'search'

  end
end
