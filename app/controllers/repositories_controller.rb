class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id']= "Iv1.82d2debbe6c4dd7d"
      req.params['client_secret']= "01c50fce1650bffaf276613ac8b7b2e2e1e80cb6"
      req.params['q']= params['query']
    end

    body = JSON.parse(@resp.body)
    @repositories = body["items"]
    render 'search'
    end 
end
