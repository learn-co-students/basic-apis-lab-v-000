class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '25a146b49de5245b4fca'
      req.params['client_secret'] = 'd83a8c3a774ad50ac834892f6cc08c9fab78f6f5'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"]
    end
    render 'search'
  end
end
