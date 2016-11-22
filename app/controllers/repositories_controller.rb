class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] =  "4bb393fa6687e49c3b40"
        req.params['client_secret'] = "2a5957f44eb891dd6757070866fa61d6a8a94ed6"

      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @resp = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
   render 'search'
  end

end
# Client ID
# 4bb393fa6687e49c3b40
# Client Secret
# 2a5957f44eb891dd6757070866fa61d6a8a94ed6

# "https://api.github.com/users/
# https://api.github.com/users/whatever?client_id=4bb393fa6687e49c3b40&client_secret=2a5957f44eb891dd6757070866fa61d6a8a94ed6
