class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = "b40446dcc91c07a2961b"
  		req.params['client_secret'] = "e3bc5477d188c38b2ab5bcf7a993854fa8382ce9"
  		req.params['q'] = params[:query]
  	end

  	body_hash = JSON.parse(@resp.body)
  	@repos = body_hash["items"]

  	render 'search'
  end
end
