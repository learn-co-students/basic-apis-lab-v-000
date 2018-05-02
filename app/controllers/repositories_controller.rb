class RepositoriesController < ApplicationController

  def search
  end

  def github_search
  begin
    @resp = Faraday.get 'https://api.github.com/search/repositories?q=' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'Iv1.77ac8be2a412942e'
      req.params['client_secret'] = 'ad37460d3f87157a18743d626033a383d90c2374'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = 'error'
    end

  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
  render 'search'
  end
end
