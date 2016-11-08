class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params[:client_id] = ENV['GITHUB_CLIENT']
        req.params[:client_secret] = ENV['GITHUB_SECRET']
      end
      body_hash = JSON.parse(@resp.body)
        @repos = body_hash["items"]
 
    render 'search'
  end

end

