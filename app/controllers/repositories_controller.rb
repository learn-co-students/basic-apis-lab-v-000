class RepositoriesController < ApplicationController

    def search

    end

    def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params["client_id"] = "7733308499f6b531b8"
        req.params["client_secret"] = "ad6932333332cd54318d1c9eaa3214680c5d54"
        req.params["v"] = '3'
        req.params["q"] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      end
      render "search"
    end

end
