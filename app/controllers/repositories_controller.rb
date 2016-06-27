class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["client_id"] = "f2ba4a14078bf652d111"
      req.params["client_secret"] = "99683453402c4986f511e4bfc5ae0be2b5de186d"
      req.params["q"] = params[:query]
      
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end

    render 'search'
  end
end
