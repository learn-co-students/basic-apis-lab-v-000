class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '9d096194123a0570c443'
      req.params['client_secret'] = '5e4e5791c210c68b7fa2cddec930b97213db4862'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @content = body
    else
      @error = "There was an error."
    end
  rescue Faraday::TimeoutError
    @error = "There was an error."
  end
    render 'search'
  end
end
