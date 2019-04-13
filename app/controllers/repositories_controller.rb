class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '355ed2defdd87d661789'
        req.params['client_secret'] = '099a67e8ea2fb757517a6094cca8d94218d94f6d'
        req.params['q'] = params[:query]
      end

      body_hash = JSON.parse(@resp.body)
      @results = body_hash["items"]


    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
      render 'search'
  end
end
