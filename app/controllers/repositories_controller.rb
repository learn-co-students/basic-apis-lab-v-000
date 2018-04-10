class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'cbc2d84328d93592f28a'
    secret = '20221a37e851408a4f865cba4988660a85d32f7a'

    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = secret
    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
