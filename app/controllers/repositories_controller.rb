class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params["q"] = params[:query]
    req.params["client_id"] = ''
    req.params["client_secret"] = ''
  end

  body = JSON.parse(@response.body)
  @results = body["items"]
  render 'search'
end

end
