class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '413a41b9d44c6a2757b2'
    client_secret = '7cba8d802e5d3942f961eb7e2ebe1889ef6b952b'

    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
      req.options.timeout = 5             #set timeout to 5 seconds
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]             # use "items" based on name used for the array of hashes in github developer examples
    else
      @error = body["meta"]["errorDetail"]
    end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout.  Please try again."
  end

    render 'search'
  end
end
