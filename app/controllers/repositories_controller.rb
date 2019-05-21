class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = '1165a285cd15c9ab3bd3'
          req.params['client_secret'] = '8ac2fb9e1bb084a2f359cb744a15c0a584f222bd'
          req.params['q'] = params[:query]
        end
        body = JSON.parse(@resp.body)
          @repositories = body["items"]
        render 'search'
      end
  end
