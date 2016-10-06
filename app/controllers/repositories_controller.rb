require 'pry'

class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params["query"]
        req.params['client_id'] = ENV['client_id']
        req.params['client_secret'] = ENV['client_secret']
      end
      @body = @resp.body

      if @resp.success?
        @repos = JSON.parse(@body)["items"]
      else
        @error = @resp.errors
      end
    rescue
      @error = "timeout error"
    end
    render 'search'
  end
end
