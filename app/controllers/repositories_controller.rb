class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'fe2ea5408affcfc6fa39'
      req.params['client_secret'] = '0625fc8819a80af78275af775eb8a4121f40ffdb'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    binding.pry
    render 'search'
  end
end
