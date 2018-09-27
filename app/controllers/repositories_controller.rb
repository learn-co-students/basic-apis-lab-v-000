class RepositoriesController < ApplicationController
  def search # implicitly renders app/views/repositories/search.html.erb view file, which contains search form and displays results
  end

  def github_search
    begin
      @response = Faraday.get('https://api.github.com/search/repositories') do |request|
        request.params['client_id'] = "client_id from my GitHub API app"
        request.params['client_secret'] = "client_secret from my GitHub API app"
        request.params['q'] = params[:query] # value submitted in query field in form
        # request.options.timeout = 0 (only to test timeout error handling & must be deleted afterward)
      end

      @body_hash = JSON.parse(@response.body)

      if @response.success? # if @response.status == 200 (success)
        @repos = @body_hash["items"] # The "items" key of the @body_hash hash points to an array of repo hashes, and I store this array in @repos
      else # @response.status == 400 (failure, error)
        @error = "#{@body_hash['message']}. Please enter a query to search repositories."
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render 'search' # render app/views/respositories/search.html.erb view file
  end
end
# Use Faraday.get("https://api.github.com/search/repositories")
# to make a GET request to the Github Repository Search API endpoint
# Any time we make a request w/ Faraday -- Faraday.get(url) --
# a response object is returned, which is stored in @response
# Faraday lets us set parameters by passing a block to the .get() method
# and adding any parameters we need through the request object via a hash of params
# The Search Repositories GitHub API indicates that I need a q parameter,
# which is a string of the search keywords
# When I make a request to the GitHub API to search repos (submitting search keywords in form),
# the JSON response object returned has a key of "items" that points to an array of repo objects
# The name of each repo is: repo.name
# The href attribute value of the <a> link to the repo is: repo.html_url
# The description of the repo is: repo.description
# The 2 main parts of response object are:
# 1). The Body, which contains the server response (error messages or JSON results)
# 2). The Status, which is the HTTP code that the server returns from the request
# We're parsing the body of the response object into a Ruby hash stored in @body_hash
# The @response.body JSON object has an "items" key that points to an array of repo objects,
# and we're using JSON.parse() method to get this items array of repo objects
# out of the @response.body JSON object and into a Ruby hash, stored in @body_hash
# @body_hash has a key of "items" that points to (and stores) an array of repo hashes
# hash[key] = value, so use repo["name"], repo["html_url"] and repo["description"]
# When accessing resources across the internet on servers out of my control (Search Repo GitHub API),
# it's possible that request timeouts can occur due to network outages or
# code on the API server that takes too long to execute, etc.
# To handle timeout error, add rescue Faraday::ConnectionFailed to repositories#github_search
