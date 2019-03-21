class RepositoriesController < ApplicationController

  def search

  end

  def github_search
		begin
			@resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
				req.params['client_id'] = 'cpdundon'
				req.params['client_secret'] = '' 
				req.params['accept'] = 'v3'
				req.params['q'] = params['query']
				req.options.timeout = 2000
			end
			body = JSON.parse(@resp.body)
			
			if @resp.success?
				@respSummary = collector(body["items"])
			else
				@error = body["meta"]["errorDetail"]
			end
 
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    
		render 'search'
  end

	def collector(body_items)
		rtn = []
		body_items.each do |el|
			datum = {name: el["name"], description: el["description"], html_url: el["html_url"]}
			rtn << datum
		end

		rtn
	end
end
