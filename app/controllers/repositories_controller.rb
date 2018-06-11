class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6a6ef6d68e50e19fc2e8'
      req.params['client_secret'] = 'd6836e09fa6d92f654da68d2aa399ca6ff578473'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      # binding.pry
      @errors = body["errors"]
    end

    render 'search'
  end

end
