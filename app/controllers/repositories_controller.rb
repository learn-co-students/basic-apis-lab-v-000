class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'b4513b734b9322bb7f4d'
      req.params['client_secret'] = '4f8cb7718f1e34ceaf1f57f8a5a17770080b15b7'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @results = body_hash["items"]
    else
      @error = body_hash["meta"]["errorDetail"]
    end
    render 'search'
  end
end
