class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.2c6bbcee08be0abd'
      req.params['client_secret'] = '02981adf80d671177a928ec2599512f77ebe3dad'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    
    render 'search'
  end
end
