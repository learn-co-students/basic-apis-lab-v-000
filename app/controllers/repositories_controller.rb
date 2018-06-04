class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    response = Faraday.get("https://api.github.com/search/respositories") do |req|
      req.params["q"] = params[:query]
      req.params["access_token"]= 'aa1141fd9dbdcfde5621a9ca1038e2b9518bb719'
    end

    body =JSON.parse(response.body)
    @results = body["items"]
    render :search
  end

end
