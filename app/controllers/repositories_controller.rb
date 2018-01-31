class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    # https://api.github.com/search/repositories
    
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      
      req.params['client_id'] = '3e951177d8a80901b228'
      req.params['client_secret'] = '4e336cae8722a23e4d4f1703e581f44257c14992'
      req.params['q'] = params['query']
      
    end
    
    body = JSON.parse(@resp.body)
    
    if @resp.success?
      @items = body["items"]
    else
      @error = body["message"]
    end
    render 'search'
    
  end
end

# Client Id - 3e951177d8a80901b228
# Client Secret - 4e336cae8722a23e4d4f1703e581f44257c14992