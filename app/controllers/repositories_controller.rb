class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.90fdf0c00384f2ba'
        req.params['client_secret'] = 'ab6de63c829368b8e75286b0e6081a7139c713c4'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = body['message']
      end
    rescue Faraday::ConnectionFailed
      @error = 'There was a timeout. Please try again.'
    end
    render 'search'
  end
end
