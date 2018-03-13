class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'Iv1.ab117139a9787cc4'
    client_secret = '72c9103a290af6495102173909ebe5d2c15a636c'

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body['items']
    render :search
  end

end
