
class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    begin

      resp =  Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params["q"] = params["query"]
        req.headers['Authorization'] = "302ec755f0d9056dff64a58494c10e324f367ece"
      
      end

      body = JSON.parse(resp.body)
      if resp.success?
        @items = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end

    rescue Faraday::ConnectionFailed
      @error = "Timeout. Please try again."
    end
    render "search"

  end
end
