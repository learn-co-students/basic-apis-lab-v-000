class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    resp = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['client_id'] = 'b728ec6181adac5ef25b'
        req.params['client_secret'] = '27d2fbdcc6eced34a3bba8c7ac0c14b93808e3b5'
        req.params['q'] = params[:query]
    end
    body = JSON.parse(resp.body)
    @repos = body["items"]
    render :search
  end
end
