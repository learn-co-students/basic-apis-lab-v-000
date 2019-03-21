class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      # get API response data into @resp
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        # indicate params to use in the search
        req.params['client_id'] = ""
        req.params['client_secret'] = ""
        req.params['q'] = params[:query]
      end
      # parse the response body to JSON
      body = JSON.parse(@resp.body)
      # handling response status/errors
      if @resp.success?
        # if successful save data of venues into a variable
        @repos = body["items"]
      else 
        # if unsuccessful save meta errorDetails
        @error = body["meta"]["errorDetail"]
      end
    render 'search'
  end
end
