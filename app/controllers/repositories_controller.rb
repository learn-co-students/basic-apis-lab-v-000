class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = client_id
        req.params['secret'] = secret
        req.params['q'] = params[:query]
      end
    end

    body = JSON.parse(@resp.body)
    @results = body['items']
    render :search
  end

end
