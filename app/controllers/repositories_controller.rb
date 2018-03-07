
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = 'Iv1.343baab21f298030'
      req.params['client_secret'] = 'dd3c78ffd81ac47e4975ee46702e272e3dc46aa1'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repo_url = body["items"][0]["html_url"]
      @desc = body["items"][0]["description"]
      @name = body["items"][0]["name"]
    else
      @error = body["meta"]["errorDetail"]
    end
    rescue Faraday::ConnectionFailed
      @error = "There was an issue sorry."
    end
      render "search"
  end
end
