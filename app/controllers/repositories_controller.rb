class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params[:client_id] = 'Iv1.ba2c587d3eaae942'
      req.params[:client_secret] = 'd2885d7124954ae3a60963ae46de65b29ea4edb7'
      req.params[:q] = 'tetris'
    end
    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
