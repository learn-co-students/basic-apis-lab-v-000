class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "Iv1.15e6bcf669cf358f"
      req.params['client_secret'] = "6b25f1e67bccc832a943b565636ed76efa0eb930"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = "There was an error. Please try again."
    end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
  render 'search'
  end
end
