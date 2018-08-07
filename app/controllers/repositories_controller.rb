class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '46f60f1b4ab5a9d44fc9'
        req.params['client_secret'] = '415d28acffe6a2c85884d28f4ea8209e13bdef02'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
        @repo_name = body["items"][0]["name"]
        @repo_url = body["items"][0]["url"]
        @repo_description = body["items"][0]["description"]
      else
        @error = body["meta"]["errorDetail"]
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
