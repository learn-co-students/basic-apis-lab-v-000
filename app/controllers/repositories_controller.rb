class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params['query']
      req.params['client_id'] = 'Iv1.5affa993ed812b95'
      req.params['client_secret'] = '972e3214ac56f463085e48f813ebef127f4a414a'
    end

    body = JSON.parse(@resp.body)

    @results = body["items"]
    render :search

  end


end
