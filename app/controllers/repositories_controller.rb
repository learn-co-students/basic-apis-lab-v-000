class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '0bcf2af76c5e06bd9fa5'
      req.params['client_secret'] = 'b9bc53fccc6f19bd98b1fa8410892ee776bc0b34'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = body['meta']['errorDetail']
    end

    rescue Faraday::TimeoutError
      @error = 'request timed out. please try again.'
    end

    render 'search'
  end
end
