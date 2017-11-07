class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] =  "Iv1.53ad79d5bbd2be18"
    req.params['client_secret'] = "fe9b7ce34652dcc71ba5f980f9ca51db78df71b0"
    req.params['q'] = params[:query]
  end
    @results = JSON.parse(@resp.body)
    @resultsbody =  @results["items"]
  render 'search'
    end


  end
