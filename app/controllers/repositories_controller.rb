class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '9d5940a9e9e477d4d75f'
    secret = "00e57c32c74038798165cb2421a047288eeb601b"

      @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params["q"] = params[:query]
        req.params["client_id"] = client_id
        req.params["client_secret"] = secret
      end

      body = JSON.parse(@response.body)
      @repos = body["items"]
      render :search
  end
end
