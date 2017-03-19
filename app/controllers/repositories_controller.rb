class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get "https://api.github.com/search/repositories" do |req| 		
  		req.params["q"] = params[:query]
  		req.params["client_id"] = "611ddb58aff7b89bc7fb"
  		req.params["client_secret"] = "QS4DRT0RTTGEEAUCCXBJ5WT3SS3KEFUSXKQMLPUHBR4XAJ5H"
  	end
  	body = JSON.parse(@resp.body)
  	@items = body["items"]

  	render :search
  end
end
