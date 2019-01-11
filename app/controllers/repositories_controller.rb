class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 2763c46e48355af545ca
      req.params['client_secret'] = 7a4a4543425aac3e30dff4cc0ad891f19e0a85ec
      req.params['q'] = params[:query]
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
