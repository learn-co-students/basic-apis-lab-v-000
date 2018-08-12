class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'fe00d2b1a19ba9884cf4'
        req.params['client_secret'] = '610709ebe66f1030b9afa7563c0b4adaad8c9f1f'
        req.params['v'] = '20160201'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = body["errors"]["message"] + ": " + body["errors"]["field"] + body["errors"]["code"]
      end
  
      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
      render 'search'
  end

end
