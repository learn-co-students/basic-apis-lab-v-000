class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.86941974cba12a69'
      req.params['client_secret'] = 'e2406af2832741e7c8430ba4922f955f70389e55'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'
  end
end
