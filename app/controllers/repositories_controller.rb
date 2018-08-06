class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params["client_id"] = "" # client_id
        req.params["client_secret"] = "" # client_secret
        req.params["q"] = params[:query]
      end

      data = JSON.parse(@resp.body)
      if @resp.success?
        @results = data["items"]
        # byebug
      else
        @error = "Oops! #{data["message"]}!"
      end


    rescue Faraday::ConnectionFailed
      @error = "Oops, time out!"
    end
    render 'search'
  end

end
