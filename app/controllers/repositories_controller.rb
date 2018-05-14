class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = "Iv1.7eef0f50077562bf"
      req.params['client_secret'] = "9c39e3f7c8cf5bccb887d1b4499709e6e6cc30d8"
    end
    
    @repo_list = JSON.parse(@resp.body)["items"]
    #binding.pry
    render :search
  end

end
