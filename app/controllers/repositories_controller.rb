require 'pry'

class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
         req.params['client_id'] = "Iv1.e30d68f1c208cb67"
         req.params['client_secret'] = "6c9e7faa17867a7fdc32bdd19cd4b4dd76aa8c78"
         req.params['q'] = params[:query]
       end
       #binding .pry
       body_hash = JSON.parse(@resp.body)
       @repositories = body_hash["items"]
       render 'search'
  end

end
