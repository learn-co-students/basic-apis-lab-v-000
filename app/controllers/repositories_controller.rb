class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      # req.params['client_id'] = '8200027f094cfeefa8ca'
      # req.params['client_secret'] = '677c6dd3a123eab7547ff24f7f5b2e5f3b71a0f2'
      req.params['q'] = params[:query]
      req.params['sort'] = 'stars'
      req.params['order'] = 'desc'
      end
      body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
    @error = body['message']
    end
    render 'search'
  end

end ## class
