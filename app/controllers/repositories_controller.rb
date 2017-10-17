class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'c4f054554554acb464c1'
      req.params['client_secret'] = '70f79d8c36edbe0055c05aa489a51a80e505f9c3'
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
