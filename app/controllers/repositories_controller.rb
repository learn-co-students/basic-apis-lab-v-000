class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'dad77b502fd4989304bf'
        req.params['client_secret'] = '71bddb68458ccae111f48b00a6430ada6354ae2d'
        req.params[:q] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      end
      render 'search'
    end
  end
end
