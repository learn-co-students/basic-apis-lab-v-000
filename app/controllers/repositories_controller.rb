class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.36a87e434a1df0c1'
      req.params['client_secret'] = 'fdccd93497f354252e735e793a6511768038c931'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
