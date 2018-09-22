class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.1eb30ba625b3146c'
      req.params['client_secret'] = 'ff63da0221912ddd6e97e1634b41daa27ced3763'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search'
  end
end
