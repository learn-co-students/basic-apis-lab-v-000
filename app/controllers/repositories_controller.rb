class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 1d6c1de4e0423aeedd2f
      req.params['client_secret'] = 1a1d72358c4aec651cd8a6dce42c670c87146f2c
  end
end
