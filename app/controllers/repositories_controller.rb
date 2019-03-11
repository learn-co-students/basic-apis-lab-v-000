class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = '5e0b4f0f5ab83cad7dff'
      req.params['client_secret'] = '8047552d4c346f364961add6c06e2ba0ba49a62f'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
   @results = body["items"]
   render :search
 end

end
