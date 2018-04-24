class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'Iv1.ba695fe930434589'
    client_secret = 'bfbb17e485cbbb8052696c6044c6cfed44794e12'

    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = client_secret
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
