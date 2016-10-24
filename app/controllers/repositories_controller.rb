class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = CLIENT_ID
        req.params['client_secret'] = CLIENT_SECRET

        #req.options.timeout = 0
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      else
        @error = body["errors"][0]['code']
      end

      render 'search'
  end
end
