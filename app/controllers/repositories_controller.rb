class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = '0cae362a3741960140e6'
          req.params['client_secret'] = 'bad9414c3993029748010cb99bc576c0ffcbd81a'
          req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)
      @repos = body_hash["items"]
      render :search
  end
end
