class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '5ecef687e13f62e8d45f'
        req.params['client_secret'] = 'f6fcc4f89739370b1b2c91748dc55940b2f6a12f'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)

      if @resp.success?
        @repos = body["items"]
      else
        @error = body["message"]
      end
      render 'search'
  end
end
