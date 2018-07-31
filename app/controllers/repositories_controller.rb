
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    qString=params[:query]
    @resp=Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['q']=qString
      req.params["client_id"]="bdc2081ffef178b404a7"
      req.params["client_secret"]="1efad0ef39b323c5ecdfa46ab258e849e54e2b7d"
    end
    body=JSON.parse(@resp.body)
    if @resp.success?
      @repos=body["items"]
    else
      @repos=body.items[0]
    end
    render 'search'
  end
end
