class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      begin
        @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
          req.params['client_id'] = '086201935cabc1661dcd'
          req.params['client_secret'] = 'd2238baaa2e93c2eb5c87d1e1d36af1e135dddb3'
          req.params['q'] = params[:query]
        end
        body = JSON.parse(@resp.body)
             if @resp.success?
               @results = body["items"]
             else
               @error = body["message"]
             end

           rescue Faraday::ConnectionFailed
             @error = "There was a timeout. Please try again."
           end
           render 'search'
         end
       end
