class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '1d2f4680ca423be1def5'
        req.params['client_secret'] = '14ba31db56e1176d5a10c0a1288a971cb366efbd'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
     render 'search'
  end
end
