class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.3fe932b69c8aa44b'
        req.params['client_secret'] = "675f5fbf61f6e31f8644dd9cacba5172a96495ea"
        req.params['q'] = params[:query]
      end

    body = JSON.parse(@resp.body)

  if @resp.success?
    @repos = body["items"]
  else
    @errors = body["meta"]["errorDetail"]
  end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
    render 'search'
end
end 
