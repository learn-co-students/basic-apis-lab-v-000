class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params['query']
      req.params['client_id'] = '150e80c4ece81b60e4a0'
      req.params['client_secret'] = '52cda54aedfac496f8a46ec56b3923415e20f113'
  end

    body_hash = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body_hash["items"]
    else
      @error = "Please enter a search value"
    end

    render 'search'
  end

end
