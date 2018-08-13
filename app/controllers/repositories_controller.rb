class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ' Iv1.b9fda237b0f4e2b2'
      req.params['client_secret'] = 'a2f34d31b52962c23d948adf0cbdc860eb659ec6'
      req.params[:q] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]

    render 'search'
  end

end
