class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @repositories = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "Iv1.5bbd7517bb0a8311"
      req.params['client_secret'] = "cde1ecac28f0002c37c6cda0107f6c87bfb151b4"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@repositories.body)
    @items = body["items"]
    render "search"
  end
end
