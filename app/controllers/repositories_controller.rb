class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.03696abe5914f018'
      req.params['client_secret'] = '228c61fcb6821d293b9c3829704e6ae3644297a1'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    if body_hash["incomplete_results"] === false
    @repos = body_hash["items"]
  else
    @error = "No results. Please try again."

  end
  render 'search'
  end
end
