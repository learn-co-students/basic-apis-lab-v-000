class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '0ae881b96e92556443d0'
      req.params['client_secret'] = 'bc48607ed37827906f63f1d1b99cc130580e1abb'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
