class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      resp = Faraday.get("https://api.github.com/search/repositories") do |req|
        req.params['client_id'] = "Iv1.795c59fc31687d11"
        req.params['client_secret'] = "ddc7566dd0e27c2bc774c7182da7b92ae67e4f52"
        req.params['q'] = params[:query]
      end

      body = JSON.parse(resp.body)
      if resp.success?
        @results = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
