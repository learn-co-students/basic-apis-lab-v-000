class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '5d0e60d1b2a778e89e02'
        req.params['client_secret'] = '22919a13450327f2dd1d45ba125e356f840ec719'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error ='Something is not right, please try again.'
      end
 
    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end
end
