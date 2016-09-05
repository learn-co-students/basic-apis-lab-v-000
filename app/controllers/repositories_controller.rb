class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin 
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] ='2ff5817178a5d79455f1'
        req.params['client_secret'] = '14d0760b712a2239dc4f6e1f1147d0ac1a185106'
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