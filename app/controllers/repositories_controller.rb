class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.eb9082befb94fcb0'
        req.params['client_secret'] = '89f8bf146f51d15f1596f206ec266ba4fd2ec4f3'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = "There was an error."
      end
    render 'search'
  end

end
