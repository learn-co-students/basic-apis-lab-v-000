class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin 
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @errors = body["errors"]
      end
    rescue Faraday::TimeoutError
    
    end
    render 'search'
  end
end
