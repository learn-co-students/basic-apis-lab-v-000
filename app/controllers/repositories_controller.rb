class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '6c087bbc97f41cac6dc6'
      req.params['client_secret'] = '28d92a155e7ec7b204ec058e40a856e929e062eb'
  end
end
