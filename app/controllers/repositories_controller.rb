class RepositoriesController < ApplicationController
  def search; end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '52fc0a2302a9fcaaae3b'
      req.params['client_secret'] = '1cb6a39b6de2a423810bfd95bcb342fdd70cf955'
      req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash['items'] if @resp.success?
    render 'search'
  end
end
