class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.6620a308191a88ee'
      req.params['client_secret'] = 'e6decad100e334b413d07b75236a068f9f2710a3'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repositories = body["items"]
    render 'search'
  end
end
