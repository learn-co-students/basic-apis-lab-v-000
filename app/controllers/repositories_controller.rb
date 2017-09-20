class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '221e6af219c01aa8ae25'
      req.params['client_secret'] ='365fdbb51a212b10dbfd89172451046711e47220'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@response.body)

    if @response.success?
      @repos = body_hash["items"]
    else
      @error = "Please enter a search value"
    end

    render 'search'
  end
end
