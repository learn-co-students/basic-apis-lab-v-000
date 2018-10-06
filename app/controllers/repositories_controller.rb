class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      # words = params[:query].split(" ").join("+")
      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      puts body
      if @resp.success?
        @results = body["items"]
      else
        @error = body["message"]
      end
      render :search
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout"
    end
  end
end
