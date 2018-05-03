class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '90219e56d69e03782ce5'
      req.params['client_secret'] = '7f7adc9dbe1d768b9858f7bc5e51c12283af90a0'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["items"]
    else
      @error = "Sorry, the API isn't working at the moment."
    end
    render 'search'
  end
  end
end
