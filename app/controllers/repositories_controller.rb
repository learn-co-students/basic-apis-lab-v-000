class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = "Iv1.e3c45d9a7c4c6559"
      req.params['client_secret'] = "7c822eb824aa6090ef7f8c2e028a6b94c430cc5d"
      req.params['q'] = params['query'] 
    end

    body_hash = JSON.parse(@resp.body)
    @results = body_hash['items']

    render 'search'
  end
end
