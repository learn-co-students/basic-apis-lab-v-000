class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = 'Iv1.6d956c7a90b6feaa'
        req.params['client_secret'] = '93214f53c93d418a3bc414ee24c283b63e2e6161'
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @results = body["items"]
      else
        @error = body["errors"]
      end

      render 'search'
    end
  end

  
end
