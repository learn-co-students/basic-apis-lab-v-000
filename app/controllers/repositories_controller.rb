class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'fc93347bd2c2750ff38a'
      req.params['client_secret'] = 'c9305d6620dcf250c8796a97f08095f27daf3865'
      req.params['q'] = params[:query]
    end
    @repos = JSON.parse(@resp.body)["items"]

    render 'search'
  end
end
