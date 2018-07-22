class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['access_token'] = '3b1728f0bb95350bd4c2977ff2abf9388bd88e0a'
      req.params['q'] = params[:query].to_s
      req.params['per_page'] = 50
      req.options.timeout = 10
    end

    body = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
