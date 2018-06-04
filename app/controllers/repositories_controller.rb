class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    response = Faraday.get("https://api.github.com/search/respositories") do |req|
      req.params["q"] = params[:query]
      req.params["access_token"]= "690ec16093636a8a7e1ee0f095d380b479ed74fe"
    end

    @body =JSON.parse(response.body)
    render '/search'
  end

end
