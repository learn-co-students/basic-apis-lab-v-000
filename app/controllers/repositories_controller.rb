class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    
    # Note : Make call to API
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |repo|
      repo.params['client_id'] = '13b3b2dfb8772692a500'
      repo.params['client_secret'] = 'f93ad0b828b5169c1fd87e92cdeb036912964d33'
      repo.params['q'] = params[:query]
    end
    
    # Note : Pull data from API response -> Change from JSON to Ruby Hash
    body_hash = JSON.parse(@resp.body)
    # puts "Response = #{@resp.body}"
    # puts "Body Hash = #{body_hash}"
    
    if @resp.success? 
      @repos = body_hash["items"]
    else
      @error = body_hash["meta"]["errorDetail"]
    end

    render 'search'
    
  end
  
end
