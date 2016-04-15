class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get "https://api.github.com/search/repositories" do |req|
      req.params['client_id'] = "1d0f298e274972934dae"
      req.params['client_secret']= "d15fd667c803ffed5512a48c1d69e0ebc0ca4695"
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)

    if @resp.success?
      @results = body['items']
    else
      @error = nil
      # add error cod here 
    end

    render 'search'

    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
  end

end
