class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'e4cfd14278f03acad9ee'
      req.params['client_secret'] = '93dbc26cc259348129f99998e0e821c220c4424e'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @gits = body["items"]
    else
      @error = body
    end
    render 'search'
  end
end
