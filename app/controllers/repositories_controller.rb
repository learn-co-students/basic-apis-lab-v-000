class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "23dfb4a838a4210de1d3"
    secret = "f3d6c1dcd8e5bd523aeed511407c21a54006ee60"


    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      # Populate params with the three values below
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    # Turn data returned from the api into JSON
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
