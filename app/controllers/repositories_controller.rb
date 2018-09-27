class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['q'] = params[:query]
  end

  body_hash = JSON.parse(@resp.body)
  @result = body_hash["items"][0]
  render 'search'
  end
end
