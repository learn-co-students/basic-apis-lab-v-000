class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin 
      @resp = Faraday.get('https://api.github.com/search/repositories?') do |req|
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body['items']
      end
    end

    render 'search'
  end
end

private

  def client_id
    '15081655'
  end

  def client_secret
    ''
  end

