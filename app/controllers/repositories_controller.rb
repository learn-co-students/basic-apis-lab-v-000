class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'cfca3d6a029ed3a5f749'
      req.params['client_secret'] = 'd27e85979e3a9dfcbccb7d4c735b0ebd90f0ab1e'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body_hash['items']
    else
      @error = body_hash['meta']['errorDetail']
    end

    render 'search'
  end
end
