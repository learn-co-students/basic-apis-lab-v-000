class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = 'Iv1.cc372eddc007c796'
      req.params['client_secret'] = '94b3a7542bbd8472a9ef321af0d7272de6cbc19b'
      req.params['q'] = params[:query]
    end
    #binding.pry
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = body['meat']['errorDetail']
    end
    render :search
  end
end
