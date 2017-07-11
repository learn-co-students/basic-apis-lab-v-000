class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     begin
     @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = "0727d594037330690e8a"
       req.params['client_secret'] = "64bfecdada228a215c75a6aba2e096a25255494b"
      #  req.params['v'] = '20160201'
       req.params['q'] = params[:query]
     end

     body = JSON.parse(@resp.body)
     if @resp.success?
       @items = body["items"]
     else
       @error = body["meta"]["errorDetail"]
     end

     rescue Faraday::TimeoutError
       @error = "There was a timeout. Please try again."
     end

     render 'search'
  end
end
