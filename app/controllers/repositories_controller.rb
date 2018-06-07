class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get "https://api.github.com/search/repositories?q=#{params[:query]}"
      @repo = JSON.parse(@resp.body)["items"][0]
    rescue Faraday::ConnectionFailed
      @error = "Timeout error. Please try again."
    end
    render 'search'
  end
end
