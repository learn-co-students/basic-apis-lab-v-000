class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    id = "b92f7cbd7e3336af56b8"
    secret = "7fa60b22e0c6110cd1b19c984e8e12a9f4b65277"

    begin
      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params[:client_id] = id
        req.params[:client_secret] = secret
        req.params[:q] = params[:query]
        req.options.timeout = 500
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

    render :search
  end

end
