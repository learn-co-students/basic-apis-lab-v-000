class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = "Iv1.6945c079a6cee707"
    req.params['client_secret'] = "16269095726fa5c0c031ca3e79b34e059e3639cc"
    req.params['q'] = params[:query]
end
body = JSON.parse(@resp.body)
@repos = body["items"]
render 'search'
end
end
