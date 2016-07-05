class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = 'd7c7e091e9bd03b89fa1'
      req.params['client_secret'] = '024fb9bbf503bf844799b4517f1f7ddebcabba91'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @body = body['items']
    end
    render 'search'
  end
end
