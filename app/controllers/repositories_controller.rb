class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @req = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'be16d2a43740e5bd0291'
      req.params['client_secret'] = 'e3251c17baa833855a3b21aa3906ec127f92621a'
      req.params['q'] = params[:query]
    end
      @hash = JSON.parse(@req.body)
      @repos = @hash['items']
      render 'search'
  end
end
