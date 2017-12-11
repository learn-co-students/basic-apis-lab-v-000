class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '2a55416a352c7caa7a53'
      req.params['client_secret'] = '760a075a30a62acb3f4ea70327005604d676cc09'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
       @results = body["items"]
      render 'search'
    end
 
end
