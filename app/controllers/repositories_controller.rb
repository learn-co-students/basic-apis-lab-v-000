
class RepositoriesController < ApplicationController

  def search

    end


  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '58d5a7cd02a61f6ef540'
      req.params['client_secret'] = 'ddf6764e5e18d61d57eb6dbb57e6d6e458c3f1fc'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
        @venues = body_hash["items"]
    else
      @error = "There was an error"
    end

    render 'search'
  end
end
