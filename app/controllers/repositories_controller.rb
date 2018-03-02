class RepositoriesController < ApplicationController
  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "" #removed before submit
        req.params['client_secret'] = "" #removed before submit
        req.params['q'] = params[:query]
      end

      @body = JSON.parse(@resp.body)
      if @resp.success?
        @results = @body['items']
      else
        @error = @body['message']
      end

    rescue Faraday::ConnectionFailed
      @error = "There was an error. Please try again."
    end
    render 'search'
  end
end
