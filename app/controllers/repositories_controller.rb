class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.3a06e096470f9a9e'
      req.params['client_secret'] = 'b75a0c419711ca76664f4b063dce28aa8428f0c6'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"]
    else
    	@errors = body["errors"]
    end
  	render 'search'
  end

end
