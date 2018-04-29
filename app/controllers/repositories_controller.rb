class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.0238bd74994a6cc7'
      req.params['client_secret'] = '68e9a2a2d846ae3d48a54f06e60f4e9f2730cc9d'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["errors"]
    end

    render 'search'
  end
end
