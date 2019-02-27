class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '1dba75b4693e43f9ef9e'
        req.params['client_secret'] = '84b08d8ae5a9d38cac97c4c2269cfc962d6913cd'
        req.params['q'] = params[:query]
      end

    body_hash = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body_hash["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
