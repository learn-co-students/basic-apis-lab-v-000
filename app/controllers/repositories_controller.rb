class RepositoriesController < ApplicationController
  def search; end

  def github_search
    begin
      @resq = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params[:client_id] = 'Iv1.7e18b63209187f28'
        req.params[:client_secret] = '243b2607134c494b9c0d111a481b48eb4616ed96'
        req.params[:q] = params[:query]
      end
      body = JSON.parse(@resq.body)
      # byebug
      if @resq.success?
        @repos = body['items']
      else
        @error = body['message']
      end
    rescue Faraday::ConnectionFailed
      @error = 'There was a timeout. Please try again.'
    end
    render 'search'
  end
end
