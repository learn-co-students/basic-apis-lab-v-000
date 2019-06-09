class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'client_id_removed'
        req.params['client_secret'] = 'client_secret_removed'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
        @results = body["items"]
        render 'search'
    end
end

# body_hash = JSON.parse(@resp.body)
#     @venues = body_hash["response"]["venues"]
#     render 'search'
