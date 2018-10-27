class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @res = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.d937262a561e8da0'
        req.params['client_secret'] = '6e24896dfd745fdfa9b54f72204a37ee214bddbf'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@res.body)
      if @res.success?
        @repos = body['items']
      else
        @error = body['message']
      end

      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end

      render 'search'
  end
end
