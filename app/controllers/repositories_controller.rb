class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'client_id'
      req.params['client_secret'] = 'client_secret'
    end
    search_hash = JSON.parse(@resp.body)
    if @resp.success?
      @items = search_hash['response']['items']
    else
      @error = 'Search Error - ' + search_hash['meta']['status']
    end
  end

  private

  def repo_params
    params.require(:query).permit(:query)
  end
end
