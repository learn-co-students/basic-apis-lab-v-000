class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = '0cf1c13633847b6fc68b'
          req.params['client_secret'] = 'f379cd5078596db128e69fcef5eaf708c1171b97'
          req.params['q'] = params[:query]
        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @resp_data = body["items"]
        end

        render 'search'
      end

end
