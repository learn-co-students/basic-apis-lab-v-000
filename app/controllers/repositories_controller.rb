class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.cab8ba98965e22ec'
      req.params['client_secret'] = '6fdc6b2edade6834d5eafbfda26a72bc34d9b0e4'
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
