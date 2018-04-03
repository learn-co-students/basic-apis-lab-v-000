class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |resp|
        resp.params['client_id'] = 'Iv1.38a5a0369c86fdf7'
        resp.params['client_secret'] = 'e990f7995b4c1dc1651e23ae124ca82f7dfe37e5'
        resp.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body['items']
      else
        @error = 'An error occured please try again'
      end
    rescue Faraday::ConnectionFailed
      @error = 'There was a timeout. Please try again.'
    end
    render 'search'
  end
end
