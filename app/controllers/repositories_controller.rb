class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'id'
    req.params['client_secret'] = 'secret'
    req.params['q'] = params[:query]
  end
 
  body = JSON.parse(@resp.body)
  if @resp.success?
    @repos = body["items"]
  else
    @error = body["meta"]["errorDetail"]
  end
  render 'search'
  end
   
end
