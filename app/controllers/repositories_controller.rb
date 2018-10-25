class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = 'Iv1.9ee335496491cb7b'
    secret = '8eaac791f718e542d642eaa9613ba7a15379b757'

    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = client_id
        req.params['client_secret'] = secret
        req.params['q'] = params[:query]
      end
    
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
  end
end
