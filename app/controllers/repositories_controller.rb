class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '34d44124c53b398a5445'
      req.params['client_secret'] = 'c990619449186fa9ae58c9c2435b9dceb684e4bb'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
     if @resp.success?
       @repositories = body["items"]
     else
       @error = body["message"]
     end
     
    render 'search'
  end
end
