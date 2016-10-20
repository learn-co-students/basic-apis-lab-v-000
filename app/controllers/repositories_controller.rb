class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'e71b55ea7c6a7a695bff'
        req.params['client_secret'] = '26631f4ae3a194dabf216c18e561cebb07837ee4'
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
