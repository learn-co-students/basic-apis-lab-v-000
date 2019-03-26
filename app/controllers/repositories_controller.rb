class RepositoriesController < ApplicationController

  def search

  end

  def github_search
  	resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'Iv1.736a1ec0e31c7243'
      req.params['client_secret'] = '2d083b4921c58569de523e2298cc3e3ae8064227' 
      req.params['q'] = params[:query]
    end
    body = JSON.parse(resp.body)
    @results = body["items"]
    render :search
 end
end

