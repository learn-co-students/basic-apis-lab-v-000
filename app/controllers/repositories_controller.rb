class RepositoriesController < ApplicationController

  def search
  end

  def github_search
      resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'cac6ef29d0822f9dea72'
        req.params['client_secret'] = 'd4f312226e426bd228ef12575036048c06a45c69'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(resp.body)
      @repos = body['items']
      render 'search'
  end
end
