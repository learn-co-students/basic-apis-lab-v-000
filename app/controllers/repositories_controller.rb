class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    query = params[:query]

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req| 
      req.params["client_id"] = "a0835d4666cb54caa8b2"
      req.params["client_secret"] = "75daa05fd6bc012e6c567e93fedae5c0b6cf765f"
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
