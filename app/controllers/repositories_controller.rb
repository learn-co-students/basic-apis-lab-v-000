class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '24662f90888b7a056b5c'
      req.params['client_secret'] = '8e7f51caf749dd345971c4c3242f3e55c444186a'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end
    render 'search' 
  end
end
