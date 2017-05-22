class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	begin
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
  		req.params['client_id'] = 'e1c184dc7562be612811'
  		req.params['client_secret'] = '74b87d494d832444e3e414bde6490f4b9dfb4e64'
  		req.params['q'] = params[:query]
  	end

  	body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = body["meta"]["errorDetail"]
    end
 
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end

    render 'search'
   end
end	

