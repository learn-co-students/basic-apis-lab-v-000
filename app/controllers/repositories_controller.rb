

class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    user_input = params[:query]
    @query = user_input.split(" ").join("+")

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
    req.params['client_id'] = 'Iv1.6fb249e0fdd7b2ac'
    req.params['client_secret'] = 'b41247c4dbc2e68344a15f4fdfc37e1331fe4035'
    req.params['q'] = params[:query]

  end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repositories = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
