class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
  		@resp = Faraday.get('https://api.github.com/search/repositories') do |req|
  			req.params['q'] = params[:query]
  			req.params['client_id'] = 'd370572b31e7a80a0416'
  			req.params['client_secret'] = 'b8fe07ec2abc75a82dc83847c5f1373d23e065fe'
  		end
  	
  	body = JSON.parse(@resp.body)
  	if @resp.success?
  		@items = body['items']
  	else
  		@error = body['message']
  	end
  		
  	rescue Faraday::TimeoutError
  		@error= "There was a timeout, please try again."
  	end
  	render 'search'
  end
end
