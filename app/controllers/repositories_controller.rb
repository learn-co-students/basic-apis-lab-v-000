class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["client_id"] = "Iv1.1db7c86e917e796b"
      req.params["client_secret"] = "58301eeac739009eea083f8341a2548777c47bbc"
      req.params["v"] = "3"
      req.params["q"] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    end
    render 'search'
  end
end
