class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories?q=tetris' do |req|
      req.params['client_id'] = 'Iv1.d9e81900426c84b8'
      req.params['client_secret'] = '970c0689f49e82b07757e88aabc1cc274a108d35'
      req.params['name'] = params[:name]
      req.params['link'] = params[:html_url]
      req.params['description'] = params[:description]
    end

    body = JSON.parse(@resp.body)
    @items = body["items"]
    render 'search'
  end
end
