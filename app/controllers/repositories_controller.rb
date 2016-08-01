class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
       req.params['client_id'] = '9562c625084b0f54bab9'
       req.params['client_secret'] = 'd55e63bbe779c65fdffb4a6369e2f8d21b49524f'
       req.params['q'] = params[:query]
     end
     body = JSON.parse(@resp.body)
     if @resp.success?
    
      @repos = body['items']
    else
      @error = "error"
    end

   
    render 'search'

  end


end
