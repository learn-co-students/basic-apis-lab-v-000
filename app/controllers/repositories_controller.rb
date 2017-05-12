class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
         req.params['client_id'] = 'e641642c496316446535'
         req.params['client_secret'] = '2abd259be5f863d132dc8ab744f96ce4dfa9949a'
         req.params['q'] = params[:query]
         req.params['sort'] = 'updated'
         req.params['order'] = 'desc'
      end
      body = JSON.parse(@resp.body)

      if @resp.success?
        @repos = body['items']
      else
        @error = body['message']
      end
    rescue Faraday::ConnectionFailed
      @error = "Connection to github failed."
    end
    render 'search'
  end
end
