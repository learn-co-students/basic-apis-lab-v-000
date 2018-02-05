class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
   @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = client_id
       req.params['client_secret'] = client_secret
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     if @resp.success?
       @results = body["items"]
     else
       @error = body["meta"]["errorDetail"]
     end

   rescue Faraday::ConnectionFailed
     @error = "There was a timeout. Please try again."
   end
   render 'search'
  end
end
