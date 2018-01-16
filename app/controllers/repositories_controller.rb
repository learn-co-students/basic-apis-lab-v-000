class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'Iv1.a29a9c40cb4ac967'
    req.params['client_secret'] = '9ff022b56c3e723ebca8dc36472a64c29913948d'
    req.params['q'] = params[:query]
  end
  body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
