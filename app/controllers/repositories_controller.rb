class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'b8c257413acb7dedb10a'
      req.params['client_secret'] = '86682fcac055c160c4c00f671d79f2d8c955b8e1'
      req.params['q'] = params[:query]
  end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
