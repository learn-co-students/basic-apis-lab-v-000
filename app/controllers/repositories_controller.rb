class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get('https://api.github.com/search/repositories') do |req|
  req.params['q'] = params[:query]
  req.params['client_id'] = 'secret'
  req.params['client_secret'] = 'secret'
end
 body = JSON.parse(resp.body)
    @repositories = body["items"]
    render :search
  end
end
