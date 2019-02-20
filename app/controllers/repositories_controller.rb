class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get"https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = "a0af5e6f97a8185a854e"
      req.params['client_secret'] = "bdc146a3a03184c8cb89c3f9836da34140a48718"
      req.params['q'] = params["query"]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end
    render 'search'
  end
end
