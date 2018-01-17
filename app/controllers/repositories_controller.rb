class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
  		resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  			req.params['client_id'] = 'NMYVALFSXDXF4TC43TL5UL45ZTA5AKJ1LUSUZ5VENGCU4W2N'
  			req.params['client_secret'] = 'DXS4AMWGF3DQ3F03OHXP2ESTXNNZQ24TWSPXRNB1GJCX3VB5'
  			req.params['q'] = params[:query]
  		end

  		body = JSON.parse(resp.body)
  		if resp.success?
  			@repos = body["items"]
  		else
  			@error = body["message"]
  		end

  	rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end

end
