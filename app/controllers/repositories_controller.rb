class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    root_path = 'https://api.github.com/'
    
    @response = Faraday.get root_path + 'search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'Iv1.d213aba1b7371e5a'
      req.params['secret'] = 'f18bed2bb0316d6e2f74cd8d085208844c119a7f'
    end

    body_hash = JSON.parse(@response.body)
    @results = body_hash['items']
    
    render :search
  end
end
