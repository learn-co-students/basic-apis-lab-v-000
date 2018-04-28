class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get'https://api.github.com/search/repositories' do |req|
      req.params['q']= params[:query]
      req.params['client_id'] = 'Iv1.1df44f6a9aa6aabc'
      req.params['client_secret'] = 'd22492fca42be651fde828757bd88cf071d29676'
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end
end
