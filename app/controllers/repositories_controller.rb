class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "6588717fd75b0556f057"
    client_secret = "23cb3afbf76c9ede21fe9bd79e7d4ed015803a3d"

    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    body_hash = JSON.parse(@response.body)
    @results = body_hash["items"]
    render :search
  end

end
