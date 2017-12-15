class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '543c0c790ecbce61ae93'
      req.params['client_secret'] = '8d1c310044280262d4d833679d4e78aa2a9d8bf3'
      req.params['q'] = params[:query]
    end

    fullresp = JSON.parse(@resp.body)
    @items = fullresp["items"]

    render 'search'

  end
end
