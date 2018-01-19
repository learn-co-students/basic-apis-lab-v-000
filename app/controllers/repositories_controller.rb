class RepositoriesController < ApplicationController
  require 'pry'

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = "c8e275962b0eadf271c4"
     req.params['client_secret'] = "e4a1b93e0051688aa0d7061117cc20677089a909"
     req.params['v'] = '20160201'
     req.params['q'] = params[:query]
   end

   body = JSON.parse(@resp.body)
   #binding.pry

   if @resp.success?
    @repositories = body["items"]
   else
    @error = body["meta"]["errorDetail"]
   end
   render 'search'
  end
end
