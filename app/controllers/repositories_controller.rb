class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'ec75868bfd655520930b'
        req.params['client_secret'] = 'f173b84ef28fdfbf3ab31223763b89931d55eac6'
        req.params['q'] = params[:query]
      end

      body = JSON.parse(@resp.body)

      if @resp.success?
        @repos = body["items"]
      else
        @error = body["message"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end
end
