class RepositoriesController < ApplicationController

  def search
    render 'search'
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id']     = '00dee71a3620e0158e0c'
        req.params['client_secret'] = 'dd22c70c5ff37daf02df430b64ccebdc109e70bd'
        req.params['q']             = params[:query]
      end

    body = JSON.parse(@resp.body)

    if @resp.success?
      @results = body
    else
      # not proper params for errors
      @error   = body["errors"]
    end

  rescue Faraday::TimeoutError
    @error = "There was a timeout. Please try again."
  end

    search
  end
end
