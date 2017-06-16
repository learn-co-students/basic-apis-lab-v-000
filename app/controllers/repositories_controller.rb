class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @response = Faraday.get("https://api.github.com/search/repositories") do |repo|
      repo.params['Client_Id'] = ENV["CLIENT_ID"]
      repo.params['Client_Secret'] = ENV["CLIENT_SECRET"]
      repo.params['q'] = params[:query]
    end
    @parsed = JSON.parse(@response.body)
    render 'search'
  end

end
