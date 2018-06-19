class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "a4687e603229a4a8df6d"
        req.params['client_secret'] = "dba20aa664d8a958a220933711d8baf50568979c"
        req.params['q'] = params[:query]
        req.options.timeout = 120
      end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render 'search'
  end
end
