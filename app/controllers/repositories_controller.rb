class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '65dd4fc19860a06adb57'
      req.params['client_secret'] = '2f2aa9e1e0918c7facbd27b4540a4296b2f74b90'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
