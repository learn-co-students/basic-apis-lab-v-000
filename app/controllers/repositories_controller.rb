class RepositoriesController < ApplicationController

  def search
    


  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "18eab421de37ecaf49b7"
      req.params['secret_id'] = "ef4f8cb0e3161643c227299783afcbf4c7a1719a"
      req.params['q'] = params[:query]
    end
    
    dataHash = JSON.parse(@resp.body)
    @repos = dataHash['items']
    render 'search'
  end

end
