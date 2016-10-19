class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'dbaecd06e6bb45a4313b'
      req.params['client_secret'] = '8162304c622e76d5cc01fcb2d9825321ea08af05'
      # req.params['v'] = '3'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    # binding.pry
    if @resp.success?
      @repositories = body["items"]
    end
    # binding.pry
    render 'repositories/search'
  end
end
