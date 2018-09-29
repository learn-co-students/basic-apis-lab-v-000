class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
  @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = ENV['CLIENT_ID']
     req.params['client_secret'] = ENV['CLIENT_SECRET']
     req.params['q'] = params[:query]
   end
    body = JSON.parse(@resp.body)
   if @resp.success?
     @items = body["items"]
   else
     @error = body["meta"]["errorDetail"]
   end
    rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
   end
   render 'search'
  end
end
