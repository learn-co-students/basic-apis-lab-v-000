class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'xxx'
        req.params['client_secret'] = 'xxx'
        req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)
      @repos = body_hash["items"]
      @name = body_hash["items"][0]["name"]
      @link = body_hash["items"][0]["html_url"]
      @description = body_hash["items"][0]["description"]
    render 'search' 
  end
end
