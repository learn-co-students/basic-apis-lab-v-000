class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    root_path = 'https://api.github.com/'

     @response = Faraday.get root_path + 'search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = ''
      req.params['secret'] = ''
    end

     body_hash = JSON.parse(@response.body)
    @results = body_hash['items']

     render :search
  end
end
