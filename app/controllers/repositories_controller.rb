class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
       @resp = Faraday.get 'https://api.github.com/search/repositories?page=1&per_page=400' do |req|
         req.params['client_id'] = '767fc0aba79d8bf64148'
         req.params['client_secret'] = '996962c0a6378bb16cb557ca1d060ea5d288f609'
         req.params['q'] = params[:query]
         #req.params['sort'] = 'stars'
         #req.params['order'] = 'asc'
       end
       body = JSON.parse(@resp.body)

       if @resp.success?
         @repositories = body["items"]
       #else
         #@error = body["meta"]["errorDetail"]
       end

       rescue Faraday::TimeoutError
         @error = "There was a timeout. Please try again."
     end
     render 'search'
  end
end
