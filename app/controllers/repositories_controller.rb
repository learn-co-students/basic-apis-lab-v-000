class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = '21741ddcc4d79351225f'
      req.params["client_secret"] = '4481577a43146ccbeab38fc1093cebee230e0000'
    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
