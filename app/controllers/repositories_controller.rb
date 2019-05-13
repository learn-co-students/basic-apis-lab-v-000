class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = '663f22357b31b4ce9a5f'
    req.params['client_secret'] = '2423cdd2b899e167ca0c21071373e89a65081618'
    req.params['q'] = params[:query]
    # req.params['name'] = name
    # req.params['link'] = link
    # req.params['description'] = description
  end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render :search
  end
end
