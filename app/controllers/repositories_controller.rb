class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params['q'] = params[:query]
      req.params['clent_id'] = '56411db6a55e262382ab'
      req.params['clent_secret'] = '97a97688bcf24107914a137b407553943550165a'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @reposit = body['items']
    else
      @error = body["meta"]["errorDetail"]
    end
    render 'search'
  end
end
