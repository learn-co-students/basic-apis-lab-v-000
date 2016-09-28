class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a244f495f3b1bd005347'
      req.params['client_secret'] = '526d7ae14f1d73d339fd2869e926ab8b888756a4'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
