class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params[:q] = params[:query]
        req.params[:client_id] = '478446000daac13ccc76'
        req.params[:client_secret] = 'd8660db7563c5ab652b1cdc8e9aa06168b702f26'
      end
      resp_hash = JSON.parse(@resp.body)
      if @resp.success?
        @repos_array = resp_hash["items"]
      else
        @error = resp_hash["message"]
      end
    rescue Faraday::ConnectionFailed
      @error = 'Timeout!'
    end

    render :search
  end
end
