class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |request|
      request.params[:q] = params[:query]
      request.params[:order] = 'desc'
      request.options.timeout = 20
    end
    results = JSON.parse(@resp.body)

    if @resp.success?
      @repos = results['items']
    else
      @error = results['message']
    end

    render 'search'
  end
end
