class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = 'Iv1.354ec761de2d0dbf'
          req.params['client_secret'] = '8643d6190cb3d6204de0d55f7ff185143cdd3ad2'
          req.params['q'] = params[:query]

        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @repos = body["items"]

        end
        render 'search'
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."

  end
end
