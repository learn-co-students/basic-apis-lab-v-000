class RepositoriesController < ApplicationController

  def search
  end
#name, link, description
  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
    end
    @items = JSON.parse(@resp.body)["items"]
    render :search
  end
end
