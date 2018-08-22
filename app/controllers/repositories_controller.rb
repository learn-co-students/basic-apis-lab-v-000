class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '1cca51596d503830d942'
        req.params['client_secret'] = 'a32be37f26631cb66dad1483f298d92fb59748f0'
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
