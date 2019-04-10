class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 90234cf42c2d055cc8ec
        req.params['client_secret'] = f7805f41484042366f258be37f7dde23fbd16f5b
        req.params['q'] = 'tetris'

      end
      body_hash = JSON.parse(@resp.body)
      @repos = body_hash["response"]["items"]
    render 'search'
  end
end
