class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req[:params][:q] = params[:query]
      req[:params][:client_id] = 'Iv1.96ee35b82e8b8968'
      req[:params][:client_secret] = '54b3636978fe6bfbd8f49b9f75633300e4c285fc'
  	end
  	if resp
      binding.pry
	  	@results = JSON.parse(resp.body)
	  else
	  	@error = 'Not Found.'
	  end
	  render :search
  end
end