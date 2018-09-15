class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = 'client_id'
      req.params['client_secret'] = 'client_secret'
      req.params['q'] = params[:query]
      req.params['name'] = params[:name]
      req.params['html_url'] = params[:html_url]
      req.params['description'] = params[:description]
    end
    #binding.pry
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
        @results = body_hash['items']
    else
      @error = body_hash['meta']['errorDetail']
    end
    render 'search'
  end
end
