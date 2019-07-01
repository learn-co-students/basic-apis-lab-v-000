class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'f5608e33ee06ca303276'
      req.params['client_secret'] = 'dffe12e176f710ee0237a543315e467fed555ef8'
    end
    body = JSON.parse(@resp.body)
    @venues = body["items"]
    render 'search'
  end
end
