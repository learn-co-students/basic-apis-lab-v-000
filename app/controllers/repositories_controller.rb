class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin 
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] ='e9485422e2df779d2a87'
        req.params['client_secret'] = 'd0d96ffcb7265ea7a498fe5a624ef1c8d8906694'
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
