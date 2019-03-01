class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
      # req.params['client_id'] = 'LAYNENZFLMPZLIMOPALOZC0XKQGJN4SZ3DZ45UADRLKPHLVN'
      # req.params['client_secret'] = 'EVYYL4ITQRDW3K1L1KBLVUSTAITPA0EJ4BACIKAMBK2SBMOG'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    # else
    #   @error = body["meta"]["errorDetail"]
    end

    # rescue Faraday::ConnectionFailed
    #   @error = "There was a timeout. Please try again."
    # end
    render 'search'
  end

end
