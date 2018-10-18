class RepositoriesController < ApplicationController
  @@client_id = '553cb02f42031bf618a8'
  @@client_secret = '2fbd2057eb190e65291ce5595e1eb23b3da848dd'

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = @@client_id
        req.params['client_secret'] = @@client_secret
        req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body_hash["items"]
      else
        @error = body_hash["message"]
      end
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
