class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)

    if @resp.success?
      @items = body_hash["items"]
    else
      @error = body_hash["message"]
    end

    render 'search'
  end
end