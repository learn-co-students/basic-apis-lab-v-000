class RepositoriesController < ApplicationController

    def search

    end

    def github_search
        # begin
            @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|  #took out @ on resp
                req.params['client_id'] = ''
                req.params['client_secret'] = ''
                req.params['q'] = params[:query]
            end

            body = JSON.parse(@resp.body)
            @results = body["items"]
            render :search

        end
    end
# end
