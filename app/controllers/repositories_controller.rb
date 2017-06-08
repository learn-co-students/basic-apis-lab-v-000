class RepositoriesController < ApplicationController
  def search
  end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'db5610889f1a5419d9bf'
      req.params['client_secret'] = 'ea6de905ad56d0e135e80bb9f0b4cdca29541ad5'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(resp.body)
    @results = body['items']
    render 'search'
  end
end
