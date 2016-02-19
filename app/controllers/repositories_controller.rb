class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params["cliend_id"] = 'b0cff82d482afe00ce09'
        req.params["client_secret"] = '9238319f8c296e45fdf3128bb92f6854e8e30da4'
        req.params["q"] = params[:query]
        req.options.timeout = 20
      end

      search_results = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = search_results["items"]
      else
        @error = search_results["message"]
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again"
    end
    render 'search'
  end
end
