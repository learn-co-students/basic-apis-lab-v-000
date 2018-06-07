class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    #  We use Faraday.get(url) to make a request to the API endpoint
  @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'Iv1.a38052bef8c4776e'
    req.params['client_secret'] = 'ee6cdc5c9d9cc282bb8d6c78e1602f4816a2bbc8'
    req.params['q'] = params[:query]
  end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
