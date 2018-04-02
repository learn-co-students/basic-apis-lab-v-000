class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories?q=' do |req|
      req.params['q'] = params[:query]
    end

    body_hash= JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render :search
  end

end
