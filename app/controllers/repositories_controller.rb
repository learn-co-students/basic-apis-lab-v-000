class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    client_id = "c8286d1b27eb8d002e10"
    client_secret = "84ed7f0715ea3f5f1d6cc3f2ae42b9af53a243bc"
    repo = {}
    @repos = []

    @resp = Faraday.get "https://api.github.com/search/repositories" do |req| 
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
      end
    body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = "errors! oh my!" #body["meta"]["errorDetail"]
      end
    render 'search'
  end
end
