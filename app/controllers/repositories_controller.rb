class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.62ccc0b049ae493b'
      req.params['client_secret'] = '040c37f36a29f9341cbd1040ccc6d163d465623a'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = body['message']
    end

    render 'search'
  end
end
