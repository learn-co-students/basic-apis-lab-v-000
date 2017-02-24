class RepositoriesController < ApplicationController

  def search


  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = 'a3ea5000c16489e89ef3'
      req.params['client_secret'] = 'b4f76ccd791240b265aaebb01440a480cb5cdc55'
      req.params['q'] = params[:query]
      req.params['per_page'] = 11400
    end

    results_hash = JSON.parse(@resp.body)

    if @resp.success?
      @items = results_hash['items']
    else
      @error = results_hash['message']
    end

    render 'search'
  end




end


# https://api.github.com/search/repositories?q=bruce&client_id=a3ea5000c16489e89ef3&client_secret=b4f76ccd791240b265aaebb01440a480cb5cdc55


# Display the search results on the page. 
# Include the name, 
# a link to the repository, 
# and the description.