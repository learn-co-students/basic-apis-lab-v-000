class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
        req.params['client_id'] = '22f6830148c69432be24'
        req.params['client_secret'] = '7a4368ffa586962afb26496ba8fa0ebaf1d2d9fc'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body['items']
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
