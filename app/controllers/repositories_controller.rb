class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '07e06061be2ca0383d2f'
      req.params['client_secret'] = '08c00f9a905d24114929accb86177fe94ec3fa4d'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @search = body["items"]
    render 'search'
  end

end