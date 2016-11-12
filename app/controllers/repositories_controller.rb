class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = "dbf33b5adc342d3a6186"
      req.params['client_secret'] = "7f1eb874fc06bbb990f7c3814346ad4ae883f286"
    end

    body = JSON.parse(@resp.body)

    # example: first_repo_name = body["items"][0]["name"]
    if @resp.success?
      @repos = body['items']
    else
      @error = "There has been an error with the API. Please try again."
    end
    render 'search'
  end
end
