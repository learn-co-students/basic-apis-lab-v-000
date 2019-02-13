class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "Iv1.2b422fb732821bef"
      req.params['client_secret'] = "308d684a068d4136a594a051728f44747d284999"
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@response.body)
    @results = body_hash['items']
    render 'search'
  end

end
