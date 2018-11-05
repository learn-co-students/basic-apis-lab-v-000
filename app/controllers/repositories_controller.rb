class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = 'Iv1.9367c6a1fb6104e3'
      req.params["client_secret"] = '889ab43a045c977259fd1d3e8e220e03e87c97db'
    end

    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end