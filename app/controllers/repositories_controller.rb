class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['q'] = params[:query]
  	end
  	body = JSON.parse(@resp.body)

  	if @resp.success?
  		@repos = body["items"]
  		#binding.pry
  	else
  		@error = body["message"]
  	end

  	render 'search'
  end



end

private

	def client_id
		'cfd100c2ba6469346aff'
	end

	def client_secret
		'62ddcf74048d66813cd51e89d4a77521178b5deb'
	end