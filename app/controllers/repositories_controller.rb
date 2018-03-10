class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '504e6e969b4a4a52c41a'
    client_secret = 'b9347656115e34f6bb0b9b35a1322cf603389f54'

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @results = body_hash["items"]
    else 
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end