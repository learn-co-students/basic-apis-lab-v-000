class RepositoriesController < ApplicationController

  def search

  end

  def github_search
	  @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
		  req.params['client_id'] = 'Iv1.fb7befd8763a5df7'
		  req.params['client_secret'] = '7a585f211c53ab30cb9961f66601bb22b489fbbd'
		  req.params['q'] = params[:query]
  	  end
	  body = JSON.parse(@resp.body)
	  @repos = body["items"]

	  render 'search'
  end
end
