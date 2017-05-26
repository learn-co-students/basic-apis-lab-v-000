class RepositoriesController < ApplicationController

  def search
    
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a671d476a0cf0e74c716'
      req.params['client_secret'] = '6ea00dcf62cb80d8a8a2d72081b353b581f92b47'
      req.params['q'] = params[:query]
      req.params['per_page'] = '100'
    end
    
    body = JSON.parse(@resp.body)
    @repos = body["items"]
    #binding.pry
    render 'search'
  end
end
