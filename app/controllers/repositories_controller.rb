class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @response = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = Rails.application.secrets.client_id
      req.params['client_secret'] = Rails.application.secrets.client_secret
    end

    body = JSON.parse(@response.body)
    if !@response.success?
      @error = body["meta"]["errorDetail"]
    else
      @repos = body["items"]
    end

    render 'search'
  end

end
