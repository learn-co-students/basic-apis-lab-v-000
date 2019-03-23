class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.5c62ba7d68f2a6ba'
      req.params['client_secret'] = 'cd2516c51d41919e8ed5b817c9ab1baa4fc89adb'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end

    rescue Faraday::ConnectionFailed
      @error = "The connection timed out. Please try again."
    end
    render 'search'
  end

end
