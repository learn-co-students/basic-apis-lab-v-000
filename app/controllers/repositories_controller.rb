class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = '00c7fd49144cdb69bb90'
      req.params["client_secret"] = '35db39e5514f7fdfa64a709b7581dd6af1cabcdb'
    end

    resp_hash = JSON.parse(@resp.body)
    if @resp.success?
      @items = resp_hash['items']
    else
      @error = resp_hash['message']
    end

    render 'search'

  end
end
