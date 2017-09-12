class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.31a2d3c8174834f7'
        req.params['client_secret'] = '6c49f006657d932a15698e04200dbaa1aea66e7b'
        req.params['q'] = params[:query]
        req.params['sort'] = 'updated'
        req.params['order'] = 'desc'
      end
      body = JSON.parse(@resp.body)

      if @resp.success?
        @repos = body["items"]
      else
        @error = body["message"]
      end

    rescue Faraday::ConnectionFailed
      @error = "Connection failed."
    end
    render 'search'
   end
end
