class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'f25f03a7bbb5af97a218'
        req.params['client_secret'] = '5355733fd5f3d8711887326d13bc7908fcc794e6'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      @repos = body['items']
      render 'search'
    end
end
