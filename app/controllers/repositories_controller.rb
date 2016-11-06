class RepositoriesController < ApplicationController

  def search
  end

  def github_search

   begin
     @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['User-Agent'] = 'Basic APIs Lab - Learn.co'
       req.params['client_id'] = ENV['GITHUB_ID']
       req.params['client_secret'] = ENV['GITHUB_SECRET']
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     if @resp.success?
       @repos = body['items']
     else
       @error = body['message']
     end
     render 'search'
   rescue
     Faraday::TimeoutError
     @error = "There was a timeout, please try again."
   end

 end
end
