class RepositoriesController < ApplicationController

  def search

  end

  def github_search


    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
         req.params['q'] = params[:query]
         req.params['client_id'] = '41b2664403d4f3724190'
         req.params["client_secret"] = '00fbd66d17f47404e51aea32f63951f2ce945b3f'
    end
    body_hash = JSON.parse(@resp.body)

    @list = body_hash["items"]

    render 'search'


  end
end
