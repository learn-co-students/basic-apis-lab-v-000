class RepositoriesController < ApplicationController

  def search

  end

  def github_search
     resp = Faraday.get('https://api.github.com/search/repositories') do |req|
          req.params['q'] = params['query']
          req.params['client_id'] = 'c15cc97f9ab897a89d03'
          req.params['client_secret'] = 'b26ba4e11632a92c6808ec10b3db40d1af8168b7'
      end
      
      body = JSON.parse(resp.body)
      if resp
          @results = body['items']
      else
          @error = body['meta']['errorDetail']
      end
      render 'search'
  end
end
