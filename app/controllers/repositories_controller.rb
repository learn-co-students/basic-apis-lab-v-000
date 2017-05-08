class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @response = Faraday.get 'https://api.github.com/search/repositories' do |request|
        request.params['client_id'] = 'a8dad9ecfbe77500a9ec'
        request.params['client_secret'] = '5e12b68cf86881e39d59b4bbd0771f4565e0f103'
        request.params['q'] = params[:query]
      end
      body = JSON.parse(@response.body)
      if @response.success?
        @results = body['items']
      else
        @error = body['message']
      end
      render 'search'
  end
end
