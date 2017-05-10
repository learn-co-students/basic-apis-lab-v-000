class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'faa3874fceedf0ff088e'
      req.params['client_secret'] = '06e6ee210ea07b47bb346aa4691e82673e7a9255'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body['items']
    else
      @error = "OOOOOPS"
    end
    render 'search'
  end
end
