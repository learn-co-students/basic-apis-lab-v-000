class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '70e91f89aac5a4c9ed23'
      req.params['client_secret'] = '5e3187361fd1b4706cff329eda93195c85bd713f'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @repos = body['items']
    render 'search'
  end

end
