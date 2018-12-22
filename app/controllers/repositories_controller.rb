class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = ENV['client_id']
          req.params['client_secret'] = ENV['client_secret']
    end
  end
end
