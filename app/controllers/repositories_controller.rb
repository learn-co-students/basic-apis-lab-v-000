class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # raise params[:query].inspect
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = '7ecfc7d89471b2212a62'
        req.params['client_secret'] = 'f7ca9c18899b5422972b35ada48ad7f94cc2cabb'
      end

      hash_body = JSON.parse(@resp.body)
      if @resp.success?
        @results = hash_body['items']
      else
        @error = hash_body['message']
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Try again."
    end

    render 'search'
  end
end
