class RepositoriesController < ApplicationController

  def search
  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '645499ce24eac85076d5'
        req.params['client_secret'] = 'f5f7c8d1a4482527297a0438b2349705a781ac3b'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = "There was an error getting the repos"
      end
      render 'search'
    end
  end
