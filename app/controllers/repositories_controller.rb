class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "0e810659c1257c68dea4"
      req.params['client_secret'] = "5d01a07b222ea749c95bd6604a9bd05268633bcc"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @body = body["items"]
    end
    render 'search'
  end
end
