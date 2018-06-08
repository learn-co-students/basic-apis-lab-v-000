class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @git = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = ''
        req.params['client_secret'] = ''
        req.params['q'] = params[:query]
        req.options.timeout = 0
      end

      body = JSON.parse(@git.body)
      @github = body['items']

    rescue Faraday::ConnectionFailed
      @error = 'There was a timeout. Please try again!'
    end
    render :search
  end
end
