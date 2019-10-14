class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['User-Agent'] = 'ronsala'
      req.params['client_id'] = ENV['CLIENT_ID']
      req.params['client_secret'] = ENV['CLIENT_SECRET']
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body
    end

    render 'search'
  end
end
