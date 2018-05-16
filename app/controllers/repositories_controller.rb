class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '11a4554f14d625879887c64a1d1222ea4a3b59b4'
      req.params['q'] = params[:query]
    end
    @body = JSON.parse(@resp.body) #works fine here
    binding.pry
    render 'search'
  end
end
