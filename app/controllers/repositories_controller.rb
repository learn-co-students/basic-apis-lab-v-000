class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'also secret'
    client_secret = 'secret'
    query = params[:query]

    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
        req.params['q'] = query
        req.params['sort'] = 'stars'
        req.params['order'] = 'desc'
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        #binding.pry
        @repos = body["items"]
      else
        @error = body["incomplete_results"]
      end
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
