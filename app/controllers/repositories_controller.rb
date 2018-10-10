class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "13e5ec84277c309d55b9"
      req.params['client_secret'] = "ed931d9d6d6c452bc9a2fd7d41126891c1c4b093"
      req.params['q'] = "tetris"

    end
    body = JSON.parse(@resp.body)

    @repositories = body["items"]
    binding.pry
    render 'search'
  end

end
