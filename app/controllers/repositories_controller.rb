class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = '0ebb41a063d5d448ec5c'
        req.params['client_secret'] = 'a14896e04762d06b4b7991a39a4640cb27b7b7af'
      end
      body = JSON.parse(@resp.body)
        if @resp.success?
          @repositories = body['items']
        else
          @error = body['message']

        end
    rescue Faraday::ConnectionFailed
      @error = 'There was a timout. Please try again.'
    end
    render 'search'
  end

end
