class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req| 
      req.params['q'] = params['query']
      req.params['client_id'] = 'e707151a9861e1bbfa3d'
      req.params['client_secret'] = '0f8827dd5b8dc9f315f904ffd70b2faf5255b8d0'
    end
    @body_hash = JSON.parse(@resp.body)['items']
    render 'search'
  end
end
