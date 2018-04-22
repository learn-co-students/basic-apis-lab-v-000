class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ENV['0bcf909fd7733b1711fe']
      req.params['client_secret'] = ENV['4ed07c165068ef30e667c05f9cbd771fe27352b1']
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body['items']
    else
      @error = body['message']
    end
    render 'search'
  end
end
