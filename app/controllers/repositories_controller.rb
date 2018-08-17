require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search

      begin
      @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
        req.params['client_id'] = ''
        req.params['client_secret'] = ''
        req.params['v'] = 'v3'

        req.params['q'] = params[:query] #+ " in:name"

    end
        body_hash = JSON.parse(@resp.body)

        if @resp.success?

            @repos = body_hash["items"]

        else
          @error = body_hash["meta"]["errorDetail"]
        end

      rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end
end
