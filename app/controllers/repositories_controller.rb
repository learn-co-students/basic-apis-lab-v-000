class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # binding.pry
    begin
    @resp = Faraday.get("https://api.github.com/search/repositories?q=params[query]/whatever?client_id=Iv1.821d8a715066a841&client_secret=11d2fc14364ac7458dcf7fa738806faa01dacd7b") do |req|
      req.params['client_id'] = 'Iv1.821d8a715066a841'
      req.params['client_secret'] = '11d2fc14364ac7458dcf7fa738806faa01dacd7b'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    # if @resp.success?
    #    @venues = body["response"]["venues"]
    #  else
    #    @error = body["meta"]["errorDetail"]
    #  end

  # rescue Faraday::ConnectionFailed
  #   @error = "There was a timeout. Please try again."
  #
  end
  render :search
end

end
