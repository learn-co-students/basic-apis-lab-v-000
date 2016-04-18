class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['access_token'] = ''
      req.params['q'] = params[:query]
      req.params['sort'] = 'stars'
    end
    @body = JSON.parse(@resp.body)["items"]
    render 'search'
    # @body["items"][0]["html_url"]
  end
end


# Name  Type  Description
# q string  The search keywords, as well as any qualifiers.
# sort  string  The sort field. One of stars, forks, or updated. Default: results are sorted by
 # best match.
# order string  The sort order if sort parameter is provided. One of asc or desc. Default: desc