class RepositoriesController < ApplicationController

  def search
  end


  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6209e325d8d6108fd948'
      req.params['client_secret'] = '08f6730cc592836a7099a5103817b35fe4458d87'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end



end
