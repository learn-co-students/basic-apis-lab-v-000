class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp= Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id']= 'a754185b6f4e0775427c'
        req.params['client_secret']= '58c213edb4ebdd2ec966e421e00241b07b4e8a83'
        req.params['q']= params[:query]
      end
      body= JSON.parse(@resp.body)
      @results= body['items']
      render 'search'
  end
end
