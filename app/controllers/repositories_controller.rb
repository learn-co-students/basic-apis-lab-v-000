class RepositoriesController < ApplicationController

  def search
  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '1bcbd15ef1bb51c041ce'
      req.params['secret'] = '1821ea0632f592823cb63295035672f541a0e112'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search

  end
end
