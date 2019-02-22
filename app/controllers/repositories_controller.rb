class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.7b028e796225c71c'
      req.params['client_secret'] = '48dc140d08c98cc66dc19418a877a440f50c3b87'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render :search
  end
end
