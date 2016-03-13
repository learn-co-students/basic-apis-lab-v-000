class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '62acdb5f1f0e20b60a8b'
      req.params['client_secret'] = '084c280e929d26162085f2f663fb71bd3aefbcb3'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body['items']
    else
      @error = body['message']
    end
    render 'search'
  end

end
