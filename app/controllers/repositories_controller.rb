class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a631deeeed6f0ceb3242'
      req.params['client_secret'] = '8c7994dda79268059c067ebefbdb80741269e81e'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)

    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end

end
