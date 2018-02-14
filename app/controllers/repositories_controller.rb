class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "Iv1.02bb87e181435272"
    client_secret = "6548cf599d62a7b48632be5c59e0e3c31cf8983c"

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      #req.params['v'] = '20160201'
      req.params['q'] = params[:query]
      #req.params['query'] = 'coffee shop'
      req.options.timeout = 30
    end
  
    
  
    body = JSON.parse(@resp.body)
    
    
    
    if @resp.success?
      #@venues = body["response"]["venues"]
      @repos = body["items"]
    else
      @error = body["meta"]["errorDetail"]
    end
    
    #rescue Faraday::ConnectionFailed
      #@error = "There was a timeout. Please try again."
    render 'search'
    #binding.pry
  end
end


