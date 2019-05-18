class RepositoriesController < ApplicationController
require 'pry'
  def search

  end

  def github_search
    # begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = 'Iv1.e35963521d171d27'
       req.params['client_secret'] = '5db2d0e72e11b68d5240b52ed48c5745c5efbf19'
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     items = body['items']
     # binding.pry
     if @resp.success?
       @repositories = items
     # else
     #   @error = body["meta"]["errorDetail"]
     end
   #
   # rescue Faraday::ConnectionFailed
   #   @error = "There was a timeout. Please try again."
   # end
   render 'search'

  end
end
