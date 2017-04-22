class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    github = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'replace_me'
      req.params['client_secret'] = 'replace_me'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(github.body)
    @github = body["items"]
    render :search
  end
end
