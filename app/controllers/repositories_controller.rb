class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'Iv1.65cf0bc084c23bb7'
      req.params['client_secret'] = 'd436bcea3c9db3eb047b06a8ffd5a19e8528be18'
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end

end
