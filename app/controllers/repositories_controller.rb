class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '7078048602b014102066'
      req.params['client_secret'] = 'fd0788013ddc3bda794005aa138213a147a88309'
      req.params['q'] = 'tetris'
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
