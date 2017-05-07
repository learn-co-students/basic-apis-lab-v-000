class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @response = Faraday.get("https://api.github.com/search/repositories") do |request|
        request.params["q"] = params[:query]
        request.params["client_id"] = "3bacd4988a2c819fa996"
        request.params["client_secret"] = "e5310aa015fce07a4e99bf9fa63fd64b740668b2"
      end

      string = JSON.parse(@response.body)
      @result = string["items"]
      render :search
  end
end
