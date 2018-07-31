class RepositoriesController < ApplicationController

def search


end

def github_search
  client_id = "1db8d03e7c5963bd2092"
  secret = '6ef010a538846114ee23cf6607db824fd6a9b970'

  resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
  end

  body = JSON.parse(resp.body)
   @results = body["items"]
   render :search
 end
end
