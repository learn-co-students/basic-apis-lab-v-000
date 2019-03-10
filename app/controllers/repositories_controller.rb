class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.09c922d491163355'
      req.params['client_secret'] = '816ab62b8b4e44003fdd9e19677a2726a66d457b'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = "There was an error."
    end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout.  Please try again."
    end
    render 'search'
  end
end