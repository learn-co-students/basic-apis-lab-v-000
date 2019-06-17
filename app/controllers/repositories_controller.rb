class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['q'] = params[:query]
        end
        body = JSON.parse(@resp.body)
        if @resp.success? #Faraday provides us with a nice abstraction in .success?
          @repos = body["items"]
        else
          @error = "There was an error"
        end
   
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
  end
end
