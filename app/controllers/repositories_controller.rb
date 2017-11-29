require 'pry'
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'fb6ca452ccfbfc8db6a3'
        req.params['client_secret'] = '7db985af76864e44d5cd85512d8c81456a343e1a'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end

    render 'search'
  end
end
