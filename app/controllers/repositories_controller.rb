class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = 'bacda8570910bf94b68c'
      req.params['client_secret'] = '95f3d39cd322c226759a4edea8352379f45739c3'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"] 
    render 'search'
  end
end
