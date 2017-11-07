class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  req.params['client_id'] = '8d1ea933c5a9be533c54'
  req.params['client_secret'] = '44fd30ab105f073d3ca6178b8bb06069ce03ecfe'
  #req.params['v'] = '20160201'
  req.params['q'] = params[:query]
  end

  body = JSON.parse(@resp.body)
  if @resp.success?
    @results = body["items"]
  else
    @error = "error"
  end
  render 'search'
  end
end
