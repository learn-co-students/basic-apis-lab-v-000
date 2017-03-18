class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = 'daa1070fb98c031bc25f'
      req.params['client_secret'] = 'b3942a8c2d7a3a2e655a4541e475d7d4b92d4c06'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @repos = body['items']
    render :search
  end
end
