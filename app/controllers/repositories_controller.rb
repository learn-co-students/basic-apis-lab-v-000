class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories')do |req|
      req.params['client_id'] = '9bf23011356a07082e79'
      req.params['client_secret'] = '41a8ac8809b5a83d581272c1fc1d9bc84d7b7bc4'
      req.params['q'] = params[:query]
      #req.params['sort'] = params[:zipcode]
      #req.params['order'] = 'coffee shop'
      #req.options.timeout = 0
    end
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    render 'search' 
  end

end
