class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'f3dc839430ae4d4de83b'
      req.params['client_secret'] = '623e8c771e9023e282e947ecc711d03577279d11'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
