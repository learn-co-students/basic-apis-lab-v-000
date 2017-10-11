class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.770f335f5c3e8ad5'
        req.params['client_secret'] = '996ebb0a16f4e3e252ad5c946c13501cc40112d3'
        req.params['q'] = params[:query]

      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = body['meta']['errorDetail']
      end
      render 'search'

    end

  end
end
