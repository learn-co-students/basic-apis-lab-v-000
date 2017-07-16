class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6ddc4495cff4dd9ed180'
      req.params['client_secret'] = '2dbabdeb53207f918476003a2ee673eb8f2b11fb'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @results = body['items']
    else
      @error = body['message']
    end
    render 'search'
  end
end
