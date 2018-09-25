class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.5c61f07f60d43ab6'
        req.params['client_secret'] = 'c3b41c1908d8dc1ca99f5e2da982ce6241ffff20'
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
