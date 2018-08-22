class RepositoriesController < ApplicationController
require 'pry'
  def search
    Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = "Iv1.0f6927f370991e90"
      req.params['client_secret'] = "d4dbd8ee4414d6c24ab168975cac6bf8039d2017"
      req.params['q'] = params[:query]
    end
  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = "Iv1.0f6927f370991e90"
      req.params['client_secret'] = "d4dbd8ee4414d6c24ab168975cac6bf8039d2017"
      req.params['q'] = params[:query]
    end
    @body = JSON.parse(@resp.body)
    @repos = @body['items']
    render 'search'
  end
end
