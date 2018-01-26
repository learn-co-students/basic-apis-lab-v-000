class RepositoriesController < ApplicationController

  def search
  end

  def github_search

    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = "2f2b3cacc08caf9ba927"
        req.params["client_secret"] = "b6804c36d70f631daf761e5d028dcef76069de77"
      end

      body = JSON.parse(@resp.body)
      @results = body["items"]
      render 'search'
  end

end
