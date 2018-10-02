class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '23a80d452e9a084044a7'
        req.params['client_secret'] = 'bb0b313f71ebdbfce9e4217cd59457696773ad93'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else

      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render "search"
  end
end
