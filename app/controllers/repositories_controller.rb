class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '01e084d49551f403c8d7'
      req.params['client_secret'] = '69a1bfef4e900654742cb8973ea5a008489008ce'
      req.params['v'] = '20160201'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["errors"][0]["code"] + " query"
    end
    render 'search'
  end

end
