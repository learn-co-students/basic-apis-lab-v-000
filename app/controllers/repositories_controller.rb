class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'v1.c5f032e339de8903'
      req.params['client_secret'] = '914cf3f0c0c5f416a17ec435261283d74f4d8332'
      req.params['q'] = params[:query]
  end
  body = JSON.parse(@resp.body)
  if @resp.success?
    @results = body["items"]
  else
    @error = body["meta"]["errorDetail"]
  end
  rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
  end
  render 'search'
end
end
