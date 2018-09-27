class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
    #   req.params['client_id'] = client_id
    #   req.params['client_secret'] = client_secret
    #   req.params['v'] = '20160201'
    #   req.params['near'] = params[:zipcode]
    #   req.params['query'] = 'coffee shop'
    # end
    # render 'search'
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.6737c689332d45f5'
      req.params['client_secret'] = '0ba9c144d67cb1ac22e70fd7cb0980320e81ff1f'
      req.params['q'] = params[:query]
    end
    
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    
    render 'search'
  end
end
