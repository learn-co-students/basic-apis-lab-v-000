class RepositoriesController < ApplicationController

  def search

  end

  def github_search

  	@resp =Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '2bca0ffc80eb91cfc84f'
      req.params['client_secret'] = '2bb45cf35316d386256ef417acd20b576edc8f8f'
      req.params['q'] = params[:query]
    end

	@body = JSON.parse(@resp.body)

	# rescue Faraday::TimeoutError
 #      @error = "There was a timeout. Please try again."
 #    end

    render 'search'

  end
end
