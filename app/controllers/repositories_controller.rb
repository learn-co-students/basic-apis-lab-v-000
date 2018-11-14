class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'ca875ea807225f5d722d'
      req.params['client_secret'] = '6de5e60ec9d2302b167a1c24a822315980ff7879'
      req.params['v'] = '20180519'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
