class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['per_page'] = '100'
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["items"]
    else
      binding.pry
      @error = body["message"]
    end

    render 'search'
  end
end
