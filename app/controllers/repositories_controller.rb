class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @body = Faraday.get 'https://api.github.com/search/repositories' do |request|
      request.params['q'] = params[:query]
      request.params['client_id'] = 'Iv1.84ff62445e3d8f16'
      request.params['client_secret'] = '17c623a98aac68bbe18d970f3d762dfb34349ad2'


    end

    @response = JSON.parse(@body.body)
    render 'search'
  end
end
