class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '584f5c3d4114986b58d1'
        req.params['client_secret'] = '44de36cf74e41c0413076c2793f4675fff256e5b'
        req.params['v'] = '3'
        req.params['q'] = params[:query]
        #req.options.timeout = 0
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      #else
      #  @error = body["meta"]["errorDetail"]
      end
    render 'search'
  end
end
