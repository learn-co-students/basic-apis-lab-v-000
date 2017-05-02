class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = '99c5a63eefe963e23cf6'
      req.params['client_secret'] = 'e50204900f701c3764252867b4ad3be08b744b5b'
      req.params['q'] = params[:query]

    end
    body_hash = JSON.parse(@resp.body)
    @repositories = body_hash["items"]

    render 'search'
  end
end
