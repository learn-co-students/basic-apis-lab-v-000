class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'e6ae4717700556208a35'
      req.params['client_secret'] = '061509578721050458d7713bfc3f63b5c8d90d70'
      req.params['q'] = params[:query]
    end 
    
    body = JSON.parse(@resp.body) 
    if @resp.success? 
      @search_results = body["items"]
    else 
      @error = 'There has been an error.'
    end 
    render 'search'
  end
end
