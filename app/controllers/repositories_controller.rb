class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['client_id'] = ENV['GITHUB_KEY']
      req.params['client_secret'] = ENV['GITHUB_SECRET']
      req.params['q'] = params[:query]
    end
    @repos = JSON.parse(@resp.body)
    render 'search'

  end
end
