class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @response = Faraday.get 'https://api.github.com/search/repositories' do |request|
      request.params['q'] = params[:query]
      request.params['client_id'] = Figaro.env.github_client_id
      request.params['client_secret'] = Figaro.env.github_client_secret
    end
    body = JSON.parse(@response.body)
    if @response.success?
      @result_items = body['items']
    else
      @error = body['message']
    end
    render 'search'
  end

end
