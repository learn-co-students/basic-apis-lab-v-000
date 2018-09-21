class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params["query"]
        req.params['client_id'] = '5871debe0556e4825b80'
        req.params['client_secret'] = '9e9caac915a132bed3485106353e4f0f222244e2'
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error= body["meta"]["errorDetail"]
      end
      render 'search'
  end
end
