require 'pry'

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params[:client_id] = ENV['GITHUB_CLIENT']
      req.params[:client_secret] = ENV['GITHUB_SECRET']
      req.params[:q] = params[:query]
    end
    body_hash = JSON.parse(resp.body)
    if resp.success?
      @results = body_hash['items']
    end
    render 'search'
  end
end
