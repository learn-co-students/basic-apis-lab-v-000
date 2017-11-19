class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '5b4a31bf4aab7e8992e4'
        req.params['client_secret'] ='367f6a437430df45489413204f2feb85de98da45'
        req.params['q'] = params[:query]

    end
    body = JSON.parse(@resp.body)
    if @resp.success?
        @responses = body['items']
        @msg = 'successful'
    else
        @error='Please try again'
    end
    render 'search'
  end

end
