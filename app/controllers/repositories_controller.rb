class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get'https://api.github.com/search/repositories' do |req| 
      req.params['client_id'] = '3f6a9c00fc13003794d4'
      req.params['client_secret'] = '02b0cd1927d7652d02cc9aed8e2dc8259ce8a0f7'
      req.params['q'] = params[:query] 
    end 

    body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["meta"]["message"]
      end
    render 'search'
  end
end
