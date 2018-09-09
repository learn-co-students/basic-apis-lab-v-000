class RepositoriesController < ApplicationController

  def search

  end



  def github_search
	# binding.pry
	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
	req.params['client_id'] = '30d728119abe7d9278fd'
	req.params['client_secret'] = '8e78c1e17fcca3d3017c8f2bd7be9c192145c0ce'
	req.params['q'] = params[:query]
	# req.params['near'] = params[:zipcode]
	# req.params['query'] = 'coffee shop'
	end
	body_hash = JSON.parse(@resp.body)
	@items = body_hash["items"]
	render 'search'
	# binding.pry
  end

end



# id 30d728119abe7d9278fd
# secret 8e78c1e17fcca3d3017c8f2bd7be9c192145c0ce



# expected to find link "https://github.com/dtrupenn/Tetris"