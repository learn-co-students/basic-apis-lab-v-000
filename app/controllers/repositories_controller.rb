class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    root_path = 'https://api.github.com/'

    @response = Faraday.get root_path + 'search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'Iv1.52127cdd7a90b572'
      req.params['secret'] = 'ec104465e2179cef490efba6a5474833c09ab054'
    end

    body_hash = JSON.parse(@response.body)
    @results = body_hash['items']

    render :search
  end
end
