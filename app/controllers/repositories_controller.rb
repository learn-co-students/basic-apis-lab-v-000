class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6e8f5de44e4873bb5b2a'
      req.params['client_secret'] = '1c9578f2978354eb13f39986a47269caed0e3a0b'
      req.params['q'] = params['query']
    end

    body_hash = JSON.parse(@response.body)
    @items = body_hash['items']
    render 'search'
  end
end
