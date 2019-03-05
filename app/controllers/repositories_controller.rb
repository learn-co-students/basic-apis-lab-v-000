class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = '23f38d85775349603bc6'
      req.params['client_secret'] = 'b094f7ab4e2970e39a68eebf59465f60fe223b01'
      req.params['code'] = '7dd8a3c8215887d965d8'
      req.params['q'] = params[:query]
    end
    @body = @resp.body
    render 'search'
  end
end
