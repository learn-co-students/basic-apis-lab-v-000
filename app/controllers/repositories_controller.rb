class RepositoriesController < ApplicationController

  def search
  end

  def github_search
     begin
       @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
         req.params['client_id'] = 'd39518d29d8d39a37017'
         req.params['client_secret'] = '02dbaf073d5a7a127693bdc3c833ca58833ff390'
         req.params['q'] = params[:query]
       end

       body_hash = JSON.parse(@resp.body)
       @results = body_hash["items"]

     rescue Faraday::ConnectionFailed
       @error = "There was a timeout. Please try again."
     end
       render 'search'
   end
 end
