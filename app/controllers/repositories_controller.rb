class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'Iv1.804c3e185f7b2981'
    secret = '174ce4b4dee3526d56a1a52c26d4a7ceaa99d812'

    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = client_id
        req.params['secret'] = secret
        req.params['q'] = params[:query]
      end  
    end

    body = JSON.parse(@resp.body)
    @results = body['items']
    render :search
  end

end
