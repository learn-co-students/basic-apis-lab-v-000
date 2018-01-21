class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    result = Faraday.get 'https://api.github.com/search/repositories' do |g|
      g.params['q'] = params[:query]
    end
    parsed_resp = JSON.parse(result.body)
    @items = parsed_resp['items']
    render 'search'
  end
end
