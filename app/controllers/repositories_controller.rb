class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req| 
      req.params['client_id'] = 'c940bc10f322a2400153'
      req.params['client_secret'] = 'c594e6f4de59f16caf1d2980f863963772470f9a'
      req.params['q'] = params[:query]
  end

  body = JSON.parse(@resp.body)
  @repos = body['items']
  render 'search'
end
end 