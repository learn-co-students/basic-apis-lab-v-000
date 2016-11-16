class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'ce8854a2ff6af2c18895'
      req.params['client_secret'] = 'dba7fc4cc4284282b7e04cd191db341cc1f0440b'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end


end
