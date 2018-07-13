class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "3f9c243f98a07a13cbd2"
      req.params['client_secret'] = "ae9fd6a11216fd07f0080f17cc17dcd052f5761c"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
