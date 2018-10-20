class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '1dd1ff99e26e994ab457'
        req.params['client_secret'] = 'ef86c9dbcc66156540a54980cfb25cb670940e27'
        req.params['q'] = params[:query]
      end
       body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
       end
     rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again at a later time."
    end
     render "search"
  end
end
