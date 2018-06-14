class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    # begin

     @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = '97732ac542e48604dd9b'
       req.params['client_secret'] = '7fc3a09d4d08b1dcf1dddcf63f09b17b0b1ca221'
       req.params['q'] = params["query"]
     end

     body = JSON.parse(@resp.body)
     if @resp.success?
       @repos = body["items"]
     end

   # rescue Faraday::ConnectionFailed
   #   @error = "There was a timeout. Please try again."
   # end
   render 'search'

  end
end
