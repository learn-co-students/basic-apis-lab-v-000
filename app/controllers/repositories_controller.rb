class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    query = params[:query]

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req| 
      req.params["client_id"] = "replace!"
      req.params["client_secret"] = "replace!"
      req.params["q"] = query 
    end

    body = JSON.parse(@resp.body)
    if @resp.success? 
      @items = body["items"]
      @num_results = body["total_count"]
    else
      @error = body["message"]
    end

    #rescue Faraday::TimeoutError
    #  @error = "There was a timeout. Please try again."
    #end
    render 'search'
  end
end
