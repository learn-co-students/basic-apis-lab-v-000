class RepositoriesController < ApplicationController
  

  def search

  end

  def github_search
    @resp=Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['q']=params[:query]
      # req.params['client_id']=Figaro.env.github_app_id
      # req.params['client_secret']=Figaro.env.github_app_secret
    end
    # --name, link, description
    body = JSON.parse(@resp.body)
    ## Need the array with key "items"

    @details=body["items"].map{|i| {"name"=>i["name"], "html_url"=>i["html_url"], "description"=>i["description"]} }

    render 'search'
  end



end
