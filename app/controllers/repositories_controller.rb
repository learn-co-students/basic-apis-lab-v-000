class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
    # begin
    # @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    #     req.params['client_id'] = '8ac78b29352a79b95dea'
    #     req.params['client_secret'] = '8e64743802754e38774e5e7f2c16c3227bc58339'
    #     req.params['q'] = 'query'
    #   end
    #   body = JSON.parse(@resp.body)
    #   if @resp.success?
    #     @repos = body['items']
    #   else
    #     @error = 'error'
    #   end
    #
    # rescue Faraday::TimeoutError
    #   @error = "There was a timeout. Please try again."
    # end
    # render 'search'
  end

end
