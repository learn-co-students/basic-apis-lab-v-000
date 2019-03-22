class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '93dfe7cb3b73e2badd5d'
      req.params['client_secret'] = 'b64f7249fcc45f84ab27c6cf6da921b05da41a05'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @items = body['items']

    render 'search'
  end
end
