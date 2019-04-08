class RepositoriesController < ApplicationController
 
  def search

  end

  def github_search
    # raise params.inspect
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    
      # user:dtrupenn
      req.params['q'] = params["query"]
     
    end
    body_hash = JSON.parse(@resp.body)
    # raise params.inspect

    @repos = body_hash["items"]
    render 'search'
  end
end
