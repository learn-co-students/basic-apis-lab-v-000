class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # begin
      # raise params.inspect
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ENV['CLIENT_ID']
        req.params['client_secret'] = ENV['CLIENT_SECRET']
        req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)
      @repos = body_hash['items']

    render 'search'
  end

end
