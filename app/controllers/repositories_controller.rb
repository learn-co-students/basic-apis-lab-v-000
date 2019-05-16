require 'pry'

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    # req.params['client_id'] = "Iv1.baa8b936f5d68c02"
    # req.params['client_secret'] = "1a9f74aab71e490a95503e4aef1532f3ef633695"
    req.params['q'] = params[:query]

    end

    body_hash = JSON.parse(@resp.body)
    if @resp.success?
       @items = body_hash["items"]
       # binding.pry
     else
      @error = body_hash["meta"]["errorDetail"]
     end

    # rescue Faraday::ConnectionFailed
    #   @error = "There was a timeout. Please try again."
    # end

    render 'search'
  end
end
