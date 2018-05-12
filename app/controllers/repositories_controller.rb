class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp= Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = "6e205992632dcf597d78"
    req.params['client_secret'] = "149bfe4cc9f5197abfdc7bee43b3d55b46a856ee"
    req.params['q'] = params[:query]


  end

  body = JSON.parse(@resp.body)
  binding.pry
if body["total_count"] > 0
  @items= body["items"]
else
  @error= "No results found."
end


render 'search'
  end
end
