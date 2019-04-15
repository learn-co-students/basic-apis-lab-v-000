class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      begin
        @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = 'Iv1.24f61cb2756ae51c'
          req.params['client_secret'] = 'd73a27e9a06c8e45b7be01c3cd5cd9e149acd678'
          req.params['q'] = params[:query]
        end

        body_hash = JSON.parse(@resp.body)
        @results = body_hash["items"]


      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
        render 'search'
    end
end
