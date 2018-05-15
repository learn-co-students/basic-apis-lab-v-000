class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.34574f5684ab3b14'
      req.params['client_secret'] = 'cb671516b079fe9a4348e86dd3b4895d0a302b2f'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
  
    if @resp.success?
      @repositories = body_hash['items']
    else
      @error = 'error!'
    end
  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end

  render 'search'
  end
end
