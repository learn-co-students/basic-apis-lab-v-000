class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'e5c751d9012b0a7f77bb'
      req.params['client_secret'] = '9d8acedc14582ddfd7b44d96800c9706b05b3582'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(resp.body)
    if resp.success?
      @results = body['items']
      # raise @results.first['description'].inspect
    else
      @error = body['errors']
    end
    render 'repositories/search'
  end

end
