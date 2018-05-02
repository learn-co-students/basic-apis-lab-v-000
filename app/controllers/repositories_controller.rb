class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'eaa3ced9645eaf8d29c0'
      req.params['client_secret'] = 'db7d99211532418e409b151b65d799a30fdb7c56'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    end

    render 'search'
  end
end
