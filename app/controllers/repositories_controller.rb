class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '390821d4eaf773c55b14'
      req.params['client_secret'] = '04547fd1ad5281d182e2fc606266db1be71dd751'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @results = body['items']
    else
      @error = body['message']
    end 
    render 'search'
  end
end
