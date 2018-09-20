class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'client_id'
      req.params['client_secret'] = 'client_secret'
    end
    search_hash = JSON.parse(@resp.body)
  end

  private

  def repo_params
    params.require(:query).permit(:query)
  end
end
