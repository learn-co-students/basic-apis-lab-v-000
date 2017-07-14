class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @res = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ENV['CLIENT_ID']
        req.params['client_secret'] = ENV['CLIENT_SECRET']
        req.params['q'] = params['query']
      end
      body = JSON.parse(@res.body)
      if @res.success?
        @results = body["items"]
      else
        @error = 'Something happened and its bad.'
      end
    rescue
      @error = 'Something happened and its bad.'
    end
    render 'search'
  end
end
