class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'Iv1.30042b2420701a14'
      req.params['client_secret'] = '77ab5d3a2e2c2a93fb719812ca37bbceab43afbb'
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    #@repo_link = body_hash[:items][:html_url]
    #@repo_description = body_hash[:items][:description]
    render 'search'
  end

end
