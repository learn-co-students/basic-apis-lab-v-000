class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '9fd17da9317695769aae'
      req.params['client_secret'] = '603b5f1ffede75d638b41a0061ebb065413ee3c9'
      req.params['q'] = params[:query]
    end 
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @results = body_hash["items"]
    else
      @error = body_hash["meta"]["errorDetail"]
    end 
    render 'search'
  end
end
