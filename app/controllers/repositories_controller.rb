class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories?client_id=9c17abc43f1ddc901fa2&client_secret=92f13ede46d089fca8af3e0d0cbb0f3fe95c74f1&q' do |req|
          req.params['client_id'] = '9c17abc43f1ddc901fa2'
          req.params['client_secret'] = '92f13ede46d089fca8af3e0d0cbb0f3fe95c74f1'
          req.params['q'] = params[:query]
          req.options.timeout = 0
        end
      body = JSON.parse(@resp.body)
        if @resp.success?
          @results = body["items"]
        else
          @error = body["meta"]["errorDetail"]
        end
   
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      @results = body["items"]
      render 'search'
  end
end
