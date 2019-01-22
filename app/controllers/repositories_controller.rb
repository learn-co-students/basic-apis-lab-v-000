class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com' do |req|
      req.params['client_id'] = "717f3cc427074e0b75c1"
      req.params['client_secret'] = "a8d5f643cb03b3f869c0995762108d8dc0ea9e71"
    end
    render 'search'
  end


end
