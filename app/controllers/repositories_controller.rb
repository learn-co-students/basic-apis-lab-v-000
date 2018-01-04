class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
      end
      body = JSON.parse(resp.body)
      if resp.success?
        @repos = body['items']
      else
        @error = body['errors'][0]['code']
      end
    rescue Faraday::ConnectionFailed
      @error = "Timeout"
    end
    
    render 'search'
  end

end
