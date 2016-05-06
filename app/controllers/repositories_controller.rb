class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = '7cf43ec67bee532875b8'
     req.params['client_secret'] = 'aedf126c78a57b2a7ba616523ca3f4a10c1db66a'
     req.params['q'] = params[:query]
   end
   body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
   render 'search'
  end




end
