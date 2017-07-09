class RepositoriesController < ApplicationController

  def searchs
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '07365582a52150a0b0ae'
      req.params['client_secret'] = '682a2170cfbcaaec7f90bf420410f3d570696794'
    end

    data = JSON.parse(@resp.body)

    if @resp.success?
      @repos = data['items']
    else
      @error = data['message']
    end

    render 'search'
  end
end
