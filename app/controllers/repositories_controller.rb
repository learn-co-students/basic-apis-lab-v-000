class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    client_id = "REPLACE ME"
    secret = "REPLACE ME"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end
    body = JSON.parse(resp.body)
    @results = body["items"]

    render :search

  end

# begin
#     @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
#         req.params['client_id'] = '363b17a8876367a5d6fc'
#         req.params['client_secret'] = '6e52471b5e7c43a728d7db66cc3519c02dfbb12c'
#         req.params['q'] = params[:query]
#         # req.params['near'] = params[:zipcode]
#         # req.params['query'] = 'coffee shop'
#       end
#       body = JSON.parse(@resp.body)

#       binding.pry

#       if @resp.success?
#         @venues = body["response"]["venues"]
#       else
#         @error = body["meta"]["errorDetail"]
#       end
 
#     rescue Faraday::TimeoutError
#       @error = "There was a timeout. Please try again."
#     end
#     render 'search'

#   end

end



