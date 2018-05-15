class RepositoriesController < ApplicationController

  def search

  end

  def github_search
   @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = 'Iv1.cde26eac6e7e1da0'
     req.params['client_secret'] = '69b02369b74e206e2a4bfecc25117998e361a81e'
     req.params['q'] = params[:query]
   end
   body_hash = JSON.parse(@resp.body)
   if @resp.success?
    @repositories = body_hash['items']
   else
    @error = "error"
   end
   render 'search'
 end
end
