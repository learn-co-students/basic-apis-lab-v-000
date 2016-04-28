class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a9560c96aaff14e1a352'
      req.params['client_secret'] = '164222c64e382b980672d77f4fa202b36c8993ae'
      req.params['q'] = params[:query]
    end
    @repos = JSON.parse(@resp.body)
    render 'search'
  end
end
