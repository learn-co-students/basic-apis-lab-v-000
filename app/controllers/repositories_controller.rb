class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @json_request = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params['query']
      req.params['client_id'] = "f2ba4a14078bf652d111"
      req.params['client_secret'] = "99683453402c4986f511e4bfc5ae0be2b5de186d"
      req.options.timeout = 600

    end
    body = JSON.parse(@json_request.body)
    if @json_request.success?
      @response = body['items']
    else
      @error = body['message']
    end


    # binding.pry
    render 'search'
  end
end
