class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'd6fd0f8972a0b19bab02'
      req.params['client_secret'] = 'b115d827911fa0c422cc37e83e763b0b6a8a48b5'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @results = body['items']
    render 'search'
  end
end
