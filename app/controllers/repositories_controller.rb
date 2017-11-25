class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    
   resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['q'] = params[:query]
      req.params["client_id"] = "a1389cb1769d84da613e"      
      req.params["client_secret"] = "5d6c51125fe09f07fa86c20c85459fc1253d5291"
          end
    body_hash = JSON.parse(resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
