class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    client_id = "9fc067441439e041a252"
    client_secret = "2a260b7cb4b2927a6003d6761bba812abc7af4d4"

    @repository_response = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
        req.params['q'] = params[:query]
    end
  
    body = JSON.parse(@repository_response.body)
    @results = body["items"]
    render 'search'
  end

end

# name items[name]
# link: items[html_url]
# description: items[description]
