class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "b20bcf6598d5ea453885"
      req.params['client_secret'] = "68adb3e28e7d04297ad31962c7eee81c34d4f946"
      req.params['q'] = params[:query] 
    end
    body = JSON.parse(resp.body)
    @results = body["items"]  
    render 'search'
  end
end
