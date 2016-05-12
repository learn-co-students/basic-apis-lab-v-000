class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'dc779e58003c996911c1'
      req.params['client_secret'] = 'acf1ebddc2e1b0b0271890afff7e14d6bf941ffe'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
