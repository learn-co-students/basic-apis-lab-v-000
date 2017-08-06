class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = ENV['CLIENT_ID']
        req.params['client_secret'] = ENV['CLIENT_SECRET']
        # req.params['client_id'] = '93a740f8bce1809be531'
        # req.params['client_secret'] = 'fb78fcafed243d76d68cec788d954593e1e01c3d'
      end

      body = JSON.parse(resp.body)
      @results = body["items"]

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
