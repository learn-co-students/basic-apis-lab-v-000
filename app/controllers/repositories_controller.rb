class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '63d5f40612e6640f498b'
      req.params['client_secret'] = 'af7e867768781f89779e20cdd16ca594466b37b3'
    end

    body = JSON.parse(@resp.body)
    @repositories = body["items"]
    render 'search'

  end
end
