class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '0458592404b84b1a4a56'
      req.params['client_secret'] = '54d58f7870c4179fafc6285b18c6fda1e33d673a'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'      
  end
end
