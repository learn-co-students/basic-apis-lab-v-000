class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.b0e1fe1a1a5f8003'
        req.params['client_secret'] = '08bf9fb085f4a30c059aa06783b9445315815651'
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
