class RepositoriesController < ApplicationController
require 'pry'
  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params["q"] = "tetris"
    end
    body_hash = JSON.parse(resp.body)
    @results = body_hash["items"]
    binding.pry
    render 'search'
  end
end
