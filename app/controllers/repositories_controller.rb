class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id']= 'd957c0c357b4a7ec3421'
      req.params['client_secret']= '9acf8cf1cb2991989cb218348783d27299168ef8'
      req.params['q'] = params[:query]
    end
    @results = JSON.parse(@resp.body)["items"]
    render :search
  end
end
