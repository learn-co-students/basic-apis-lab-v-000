class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client id'] = '6f91bc3dd5eddfc5526f'
      req.params['client secret'] = '1693149d565446b843f2cfd2bfa6cef920b1ae63'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
