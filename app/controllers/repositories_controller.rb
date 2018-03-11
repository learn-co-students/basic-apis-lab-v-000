class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp  = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "Iv1.92819804fed5fa63"
      req.params['client_secret'] = "c5e37fe903bc4124b3bf3c59a4fddc74f8282c1c"
      req.params['q'] = params['query']
 
    end
       
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["items"]
    # binding.pry
    render 'search'
  end

end
