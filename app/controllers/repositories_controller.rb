class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.9d435c433be66b88'
      req.params['client_secret'] = '513071f14f0741f8865c5c92a1b8034b6a6ac1e1'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    end
    render 'search'
  end
end
