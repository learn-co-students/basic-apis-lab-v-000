class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'a22a24c6c61f3fafa684'
        req.params['client_secret'] = '83f5749c5ff608230335534740e8cf41f27ef0b7'
        req.params['q'] = params[:query]
      end
      if @resp.success?
        body = JSON.parse(@resp.body)
        @items = body['items']
      else
        @error = 'Error'
      end
    rescue Faraday::ConnectionFailed
      @error = 'Time out Error!'
    end
    render 'search'
  end
end
