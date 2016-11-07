class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = 'b28cb1ff3e81b110ab98'
        req.params['client_secret'] = '610dce16dc33fc7a177687a07f2148844316a333'

      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["repos"]
      else
        @error = body["errors"][0]['code']
      end
 
    render 'search'
  end

end