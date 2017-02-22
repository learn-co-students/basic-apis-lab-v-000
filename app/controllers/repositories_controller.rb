class RepositoriesController < ApplicationController

  def search

  end
  
  
  def github_search
        @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    	req.params['client_id'] = '53122d0ddc2d7064d9bb'
    	req.params['client_secret'] = '676826dbb4a12918633b14d6092a9ddc57acb6a0'
    	req.params['q'] = params[:query]     
        end
        render :search
  end

end
