class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'a6c696481d4dc788b208'
        req.params['client_secret'] = '62bd5e23c1514375fbf8edd016da590826383091'
        req.params['q'] = 'name'
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repositories = body["items"]
      else
        @error = "#{body["errors"]["field"]} field, #{body["errors"]["code"]}"
      end

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
