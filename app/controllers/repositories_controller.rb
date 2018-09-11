class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'enter-client-id-here'
      req.params['client_secret'] = 'enter-client-secret-here'
      req.params['q'] = params[:query]
    end
  body = JSON.parse(@resp.body)
  if @resp.success?
    @results = body["items"]
  else
    @error = body["meta"]["errorDetail"]
  end
  render 'search'
end
end
