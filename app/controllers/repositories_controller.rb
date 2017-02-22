class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = "8e33bd52036550eb2e57"
      req.params['client_secret'] = "5b9d014d9a9e2780a01accb249d75a261eef227d"
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]

    render 'search'
  end

end
