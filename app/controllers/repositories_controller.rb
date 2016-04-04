class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'cedcdd49313d718a170e'
      req.params['client_secret'] = 'b2b217cafbc1ab278ba8b42edccd219d2268eff9'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end

    render 'search'
  end
end
