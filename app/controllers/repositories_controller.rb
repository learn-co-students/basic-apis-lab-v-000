class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '0dca3f7c89ec46855f8e'
      req.params['client_secret'] = 'e4691983152af41c47bc3a5eb5422b07fdc04d27'
      req.params['q'] = params['query']
    end
    # need @error and @repos
    parsed_json = JSON.parse(@resp.body)
    if @resp.success?
      @repos = parsed_json['items']
    else 
      @error = "There was an error with your search. Please try again."
    end 
    render 'search'
  end

end
