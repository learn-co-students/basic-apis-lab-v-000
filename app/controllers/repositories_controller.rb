class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params[:client_id] = 'bf2371881819842c05f9'
      req.params[:client_secret] = '18d6272921a685e5f2d6b5910b6f26d73c611bfd'
      req.params[:q] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end
end
