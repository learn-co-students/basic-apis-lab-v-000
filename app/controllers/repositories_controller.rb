class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '1a758ce13cd564a8b425'
      req.params['client_secret'] = '1a0daa8f65cfbe31651a16df49e2b31d478b97f9'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
