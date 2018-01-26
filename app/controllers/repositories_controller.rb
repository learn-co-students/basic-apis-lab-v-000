
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    #binding.pry
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
     req.params['client_id'] = 'N1WA1KZL2EDDKSMVGSPPI5F5H21DJBPBKUKPOFYWMK3BKJQR'
     req.params['client_secret'] = '00QJAMOOEELIYWJHQWD2J5ARGMLELVTUGYVDC4RBAYOGRLJB'
     req.params['q'] = params[:query]
    end

    body_hash = JSON.parse(@resp.body)
    @results = body_hash["items"]
    render 'search'
  end
end
