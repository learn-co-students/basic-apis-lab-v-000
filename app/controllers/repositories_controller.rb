class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = 'Iv1.9cc07e381d7fe69b'
      req.params['client_secret'] = '3a2f0f45795e39833828fb1769a58b6fc140ba3d'
      req.params['v'] = '20160201'
      req.params['q'] = params[:query]
    end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = body["incomplete_results"]
        # ["errorDetail"]
      end
        render 'search'

  end
end
