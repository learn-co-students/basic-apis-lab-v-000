class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'e72c16d7501e796b3116'
      req.params['client_secret'] = 'd508604246c6dd9540daad9973d4671143e543ec'
    end

    body = JSON.parse(response.body)

    @repos = body["items"]

    render 'search'
  end
end
