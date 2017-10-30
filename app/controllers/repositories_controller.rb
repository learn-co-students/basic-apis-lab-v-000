class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "bea0ab41cd73b3245542"
    client_secret = "a11c44b3cefa869179155221091645e0e7ba4d6c"

   @resp = Faraday.get ('https://api.github.com/search/repositories') do |req|
       req.params['client_id'] = client_id
       req.params['client_secret'] = client_secret
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     @results = body["items"]
     render :search

  end
end
