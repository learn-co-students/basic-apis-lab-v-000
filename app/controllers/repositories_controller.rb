class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = '1284c1cfc41fcc61c48e'
      req.params['client_secret'] = '9591643f45dd37ad285d56a82d9fe8b6bb7ba54a'
      req.params['v'] = '3'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(resp.body)
    #binding.pry
    @items = body_hash["items"]
    render 'search'
  end
end
