class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin 
      #replace with your GitHub client id
      client_id = ''
      #replace with your GitHub secret
      client_secret = ''

      resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
      end
    
      body = JSON.parse(resp.body)

      if resp.success?
        @results = body["items"]
      else 
        @error = body["message"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render :search
  end
end