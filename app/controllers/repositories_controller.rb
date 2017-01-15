class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @req = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '95e41c21769b477c7eb5'
      req.params['client_secret'] = '53352019bd1274357851d856d029ef0e9eca2afa'
      req.params['q'] = params[:query]
    end
    @hash = JSON.parse(@req.body)
    @repos = @hash['items']
    render 'search'
  end
end
