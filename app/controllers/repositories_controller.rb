class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.a09247683f6606b8'
      req.params['client_secret'] = 'e70ffe031533d4ccc3efb3dd9db35e7672d83336'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body['items']
    render 'search'
  end

end
