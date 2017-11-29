class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '73e61d1f5fcaf128fadf'
      req.params['client_secret'] = '28f260db936fc79f40cc6fa7d931774b01530407'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end
end
