class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
  @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|

    req.params['client_id'] = "Iv1.5b13ee679c65d93b"
    req.params['client_secret'] = "4e1f80894ec46e52e7581f6784ab315955afaf4b"
    req.params['q'] = "tetris"

  end
    body_hash = JSON.parse(@resp.body)

      if @resp.success?

        @name = body_hash["items"][0]["name"]
        @url = body_hash["items"][0]["html_url"]
        @description = body_hash["items"][0]["description"]
      else
        @error = body["meta"]["errorDetail"]
      end
  rescue Faraday::ConnectionFailed
    @error = "There was a timeout. Please try again."
  end
    render 'search'
  end
end
