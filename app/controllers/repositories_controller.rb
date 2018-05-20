class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.21be741d4e33e9ad'
      req.params['client_secret'] = '386a6b1e76d62747b8a3611693497b56a3a4ba8a'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
