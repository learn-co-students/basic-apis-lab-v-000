class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = '0b9ad2b244977167ac45'
      req.params['client_secret'] = '428cfffbe798180383ef37c05c86e1e90f8bf61b'
      req.params['q'] = params[:query]
    end
      body = JSON.parse(@resp.body)
    #  if @resp.success?
        @repos = body["items"]
     #else
      # @error = body["meta"]["errorDetail"]
    # end
    render 'search'
  end

end
