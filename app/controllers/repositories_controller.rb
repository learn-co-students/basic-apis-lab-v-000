class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          # req.params['client_id'] = "4b97e9df93b8b6c6eb6f"
          # req.params['client_secret'] = "b8635f8b727bc381926171c1d1694349df1b8ad6"
          req.params['q'] = params[:query]
        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @body = body["items"]
        end
      render 'search'
    end
  end
end
