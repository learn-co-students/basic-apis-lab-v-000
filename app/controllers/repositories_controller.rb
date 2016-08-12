class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '307d673639f12c439f51'
      req.params['client_secret'] = 'dec7bd836ef95c5df330ac1c3b47a2a0e16c47f0'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'
  end

end
