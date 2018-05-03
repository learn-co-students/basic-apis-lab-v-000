class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     begin
     @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = 'client_id'
       req.params['client_secret'] = 'client_secret'
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     if @resp.success?
       @repositories = body["items"]
     else
       @error = "Sorry, the API isn't working at the moment."
     end
     render 'search'
   end
   end
end
