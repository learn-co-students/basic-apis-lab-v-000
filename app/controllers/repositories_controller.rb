class RepositoriesController < ApplicationController
  # Client ID
  # 821b13c169f9c06cc507
  # Client Secret
  # 8962cd22399957c2c253898e5009b9a6efcd88d0
  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["message"]
      end
    rescue Faraday::ConnectionFailed # catch any failures
      @error = "There was a timeout. Please try again"
    end
    render :search
  end
end
