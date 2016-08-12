class RepositoriesController < ApplicationController
  require 'pry'
  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '57e1305ca212cd6ea6b4'
      req.params['client_secret'] = '9864fb8ad4d7caba9ded66681ce7e6af3661343d'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items']
    render 'search'
  end
end
