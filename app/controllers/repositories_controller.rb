class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
    end

    @body_hash = JSON.parse(@resp.body)
    @repositories = @body_hash["items"]
    render 'search'
  end
end
