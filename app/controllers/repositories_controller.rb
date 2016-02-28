class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      #req.params['client_id'] = client_id #FILL OUT
      #req.params['client_secret'] = client_secret #FILL OUT
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)

    if @resp.success?
      @items = body_hash["items"]
    else
      @error = body_hash["message"]
    end

    render 'search'
  end
end
