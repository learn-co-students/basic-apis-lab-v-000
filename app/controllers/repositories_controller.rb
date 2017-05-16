class RepositoriesController < ApplicationController

    def search

    end

    def github_search
        @resp = Faraday.get 'https://api.github.com/search/repositories' do |request|
            request.params["q"] = params[:query]
            request.params["client_id"] = ENV['GH_LAB_CLIENT_ID']
            request.params["client_secret"] = ENV['GH_LAB_CLIENT_SECRET']
        end

        if @resp.success?
            body = JSON.parse(@resp.body)
            @items = body["items"]
        else
            @error = JSON.parse(@resp.status)
        end
        render :search
    end
end
