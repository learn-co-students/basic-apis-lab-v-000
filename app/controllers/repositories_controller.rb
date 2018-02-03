class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['q'] = params[:query]
  		req.params['sort'] = 'stars'
  		req.params['order'] = 'desc'
  		req.params['client_id'] = 'Iv1.1997aa184fb04a06'
  		req.params['client_secret'] = '14c59161379efc39b4d5e9ac09e7041c535dd537'
  		
  	end
  	body_hash = JSON.parse(@resp.body)
  	if @resp.success?
	  	@repos = body_hash["items"]
  	else
  		@error = body_hash["meta"]["errorDetail"]
		end
		render 'search'
		end
  end



