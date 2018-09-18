class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '3d4fdf55eb545a37bd25'
      req.params['client_secret'] = 'eece3f073dffee29ad3e224583ea5e98e058'
      req.params['q']= params[:query]
    end

      body = JSON.parse(@resp.body)
      @names = body["items"]
     render :search
  end

end
