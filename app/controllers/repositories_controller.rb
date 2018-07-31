 class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ENV['GITHUB_ID']
        req.params['client_secret'] = ENV['GITHUB_SECRET']
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      else
        @error = "#{body["errors"][0]["resource"]} #{body["errors"][0]["code"]}"
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout.  Please try again."
    end
    # raise params.inspect
    render 'search'
  end

end
