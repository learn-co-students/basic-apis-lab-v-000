class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.8a1f6946890b42a3'
        req.params['client_secret'] = 'a5b148b43c4573aa2ea48328c058369e7eb7b235'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
       if @resp.success?
         @repos = body["items"]
       else
         @error = body["meta"]["errorDetail"]
       end
       rescue Faraday::TimeoutError
        @error = "There was a timeout. Please try again."
       end
      render 'search'
    end
end
