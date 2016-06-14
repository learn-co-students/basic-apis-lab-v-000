class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'ea073d716494b06d38e7'
    req.params['client_secret'] = '7e044af0d5487acdd503723e91991bf1d1257ba3'
    req.params['q'] = params[:query]
  end

  body = JSON.parse(@resp.body)
#  if @resp.success?
    @results = body["items"]
#  else
#    @error = body["meta"]["errorDetail"]
#  end
  render 'search'

  end
end
