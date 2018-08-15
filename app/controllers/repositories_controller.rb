class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id']='fe3818932ea6a8301c99'
      req.params['client_secret']= '6375ea4e603f0dff1028e6228f31fc32cdd42c7a'
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
