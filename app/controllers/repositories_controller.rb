class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '90f89ce63748e1bebde0'
        req.params['client_secret'] = '193b8d4b90b669496826bb8ced5b05f93a1cba7b'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
       @repos = body["items"]
      else
       @error = "error"
      end
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
