class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'd0d4b0566e79ba811689'
      req.params['client_secret'] = 'a4e4c3669c8cf3b82a8de926050fa7533493597d'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    end
    render 'search'
  end
end
