class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '43824328df9277bb'
        req.params['client_secret'] = '5e12f7c1c738831bfb4fc618d10728be2da33fa8'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
        @repo_name = body["items"][0]["name"]
        @repo_url = body["items"][0]["url"]
        @repo_desc = body["items"][0]["description"]
      else
        @error = body["meta"]["errorDetail"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end

end
