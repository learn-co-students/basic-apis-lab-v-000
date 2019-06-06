class RepositoriesController < ApplicationController

  def search
    @query = params[:query]
  end

  def github_search
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
    req.params['client_id'] = 'Iv1.6fb249e0fdd7b2ac'
    req.params['client_secret'] = 'b41247c4dbc2e68344a15f4fdfc37e1331fe4035'
    req.params['q'] = '@query'

  end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["response"]["venues"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
