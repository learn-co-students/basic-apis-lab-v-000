class RepositoriesController < ApplicationController
  def search
  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.deda5d6e12765f53'
      req.params['client_secret'] = '780c1b581f2c09358a437d613ca5609168e01eb5'
      req.params['v'] = '20180519'
      req.params['q'] = params[:query]
    end
    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]
    render 'search'
  end
end
