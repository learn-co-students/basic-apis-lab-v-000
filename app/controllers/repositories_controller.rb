class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = 'a51e11be82dd988de43d'
     req.params['client_secret'] = '4325e626e4786bea414f1d00ae9afe6d6a89cd4f'
     req.params['q'] = params[:query]
   end

   body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["message"]
      end

   render 'search'
  end
end
