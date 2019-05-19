class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
   req.params['client_id'] = 'Iv1.ff1f1ff0a704e37b'
   req.params['client_secret'] = 'cbaa323f059288503a080f42995138f3cf455f4d'
   req.params['q'] = params[:query]
 end
 body = JSON.parse(@resp.body)
 @results = body["items"]
 render 'search'
  end
end
