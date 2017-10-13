class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '157de3ee6560535be81a'
        req.params['client_secret'] = 'c83f8a9eb08ae40c58c6381d87d0ab3ea60f3b4e'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end
    render 'search'
  end
end
