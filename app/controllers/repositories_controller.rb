class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = 'Iv1.a538563e0f491a60'
       req.params['client_secret'] = 'be51fee86dd1f901504289587323e93f8c3898eb'
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     if @resp.success?
       @results = body['items']
     else
       @error = body['message']
     end
     render 'search'
   end
end
