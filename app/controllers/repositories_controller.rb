class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	require 'pry'
  	@response = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'accd39d48dea3ed1f489'
      req.params['client_secret'] = '654766b8cb7dfa68f816f5fb938e035dbfdd27dc'
      req.params['q'] = params[:query]
    end
    @response=JSON.parse(@response.body)
    render 'search'
  end
end
