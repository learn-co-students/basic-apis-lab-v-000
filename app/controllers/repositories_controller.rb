class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['app_id'] = '36833'
      req.params['client_id'] = 'Iv1.258d52586d236fed'
      req.params['client_secret'] = 'fa3b9724152a4273b844ea9e1471a0613e58ecaa'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render 'search'
  end



end
