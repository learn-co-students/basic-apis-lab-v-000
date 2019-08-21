class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params[:client_id] = '3fb2e832f62a674d9443'
      req.params[:client_secret] = 'f9ff0bda23c683838567122a520f1d1105f201f4'
      req.params[:q] = params[:query]
    end
    response_body = JSON.parse(@response.body)
    @repos = response_body['items']
    render :search
  end
end
