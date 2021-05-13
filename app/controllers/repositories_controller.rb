class RepositoriesController < ApplicationController

  def search

  end

  def github_search

  @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.56676a2791e09ada'
      req.params['client_secret'] = '7e9a9a9313f57875f683926d63a201f6349089a0'
      req.params['q'] = params["query"]
    end
    body_hash = JSON.parse(@resp.body)
    @repo = body_hash["items"]
    render 'search'
  end
end
