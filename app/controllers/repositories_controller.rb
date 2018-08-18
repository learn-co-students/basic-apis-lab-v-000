class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] =params[:query]
      end

      body = JSON.parse(@resp.body)
      @repositories = body["items"]
      render 'search'
    end
  end
end
# Client ID
# 137a3ff9eb6358213d7b
# Client Secret
# 9d2548280b5e4c7c50700bd4459fa0e35cf4a5ae
