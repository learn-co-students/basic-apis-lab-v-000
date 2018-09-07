class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'c00d89b24ae75d12846d'
      req.params['client_secret'] = '1c3f33f5133ecb39a04f69eb88549d552649879d'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body_hash["items"]
    end
    render 'search'
  end
end
