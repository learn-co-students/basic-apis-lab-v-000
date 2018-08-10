class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['q'] = params[:query]
  		req.params['per_page'] = 100
  		req.params['client_id'] = "Iv1.f56001f96c5ee2f5"
  		req.params['client_secret'] = "ca4f28c389270ed83cc454f59955873c673d074a"
  	end
  	body_hash = JSON.parse(@resp.body)
  	@repositories = body_hash["items"]
  	render 'search'
  end
end
