class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'replace me'
        req.params['client_secret'] = 'replace me'
        req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
