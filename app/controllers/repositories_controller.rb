class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'e47847cc903306341302'
      req.params['client_secret'] = 'a69126877f2e72e6a4cc6ca7065e101b934f9d5d'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @items = body_hash["items"]
    # else
    #   binding.pry
    end
    # binding.pry
    render 'search'
  end
end
