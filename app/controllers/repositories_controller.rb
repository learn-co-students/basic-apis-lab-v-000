class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'e162519a9bc83262fec7'
        req.params['client_secret'] = '0439d7f1b14b207365bcfd5539bd132385b73025'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)

      if body["total_count"].present?
        @items = body["items"]
      else
        @error = 'There were no results. Please try another search term'
      end

      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end

      render 'search'
  end
end
