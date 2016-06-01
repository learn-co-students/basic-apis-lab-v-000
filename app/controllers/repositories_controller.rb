class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '55d7c453cf1c53915d86'
      req.params['client_secret'] = '8bd5ba26eb07226e14f0cf247b67bca5d67d31e7'
      req.params['v'] = '20160531'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = body['meta']['errorDetail']
      end
    render 'search'
  end
end
