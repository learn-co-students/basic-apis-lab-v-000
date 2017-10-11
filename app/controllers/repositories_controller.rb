class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6a370882f76354562adc'
      req.params['client_secret'] = '3d77f23b067966488ce1ffd46e338d8ec280d5ed'
      req.params['q'] = params[:query]
    end
    binding.pry
    body_hash = JSON.parse(@resp.body)

  end
end
