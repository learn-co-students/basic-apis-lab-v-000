class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = "Iv1.96ed4cd4419b4051"
      req.params['client_secret'] = "382dd66c67b6c030786f4807ef455fcefa307258"
      req.params['q'] = params[:query]
      end
    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render :search
  end
end
