class RepositoriesController < ApplicationController

  def search
  end
  #
  def github_search
    client_id = "c4455ab523825df2363d"
    client_secret = "2cf89fad3ae632201c4da06f7089a98c48c1ef98"
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = client_id
     req.params['client_secret'] = client_secret
     req.params['q'] = params[:query]
     req.options.timeout = 0
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
   end

 end
