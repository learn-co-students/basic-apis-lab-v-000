class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    @name =  body_hash["items"].first["name"]
    # p body["items"].first["full_name"]
    @description = body_hash["items"].first["description"]
    # p body["items"].first["url"]

    render 'search'

  end
end
