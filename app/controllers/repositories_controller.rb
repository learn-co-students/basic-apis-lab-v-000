class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '906c6a2a507cdee048f4'
      req.params['client_secret'] = 'c9c5a9fe99fa8d9c07b68e7e9506de0973f17582'
      req.params['q'] = params[:query]
    end
  body = JSON.parse(resp.body)
  @results = body["items"]
  render 'search'
  end
end
