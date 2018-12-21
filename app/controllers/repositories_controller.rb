class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.30b7f1bf97cc9ab7'
      req.params['client_secret'] = 'fcc3231091a9f342b8932730b0fa19c8a3aede0c'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
