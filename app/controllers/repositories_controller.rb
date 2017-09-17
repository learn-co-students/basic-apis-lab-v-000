class RepositoriesController < ApplicationController

	def search

	end

	def github_search
		client_id = '820df0228a6c13ce06e4'
		secret = 'c4e31b9b3a09d94d7cf6c92b9a200a2eb7115dba'

		@resp = Faraday.get("https://api.github.com/search/repositories") do |req|
			req.params["q"] = params[:query]
			req.params["client_id"] = 'ID'
			req.params["client_secret"] = secret
		end

		body = JSON.parse(@resp.body)
		@results = body["items"]
		render 'search'
	end
end
