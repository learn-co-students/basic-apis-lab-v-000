class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = 'eda70c6f0c3eb1bd5ec4'
        req.params["client_secret"] = '3c6856e786760a2715c4fa3b1a5f66b3d905c57b'
      end

      body = JSON.parse(resp.body)
      @repos = body["items"]
      render :search
    end
  end
end
