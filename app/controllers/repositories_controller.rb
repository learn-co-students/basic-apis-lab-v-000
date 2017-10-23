class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin 
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] ='3de61ea8d6d2f4b5fe8a'
        req.params['client_secret'] = 'd7dae581f296ca107b906b53fe799e54a1d3363c'
        req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body
    else
      @error = "Not found"
    end

    rescue Faraday::TimeoutError
      @error = "There was a timeout error"
    end
    render 'search'
  end
end