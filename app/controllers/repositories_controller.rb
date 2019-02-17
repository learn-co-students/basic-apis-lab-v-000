require 'pry'

class RepositoriesController < ApplicationController

  def search
  
  end

  def github_search
    client_id = ENV['client_id']
    client_secret = ENV['client_secret']
    repo = {}
    @repos = []

    
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        #  for the client_id and Client_secret, you are expect to put the real
        # client_Id and client_secret into the code...
        req.params['client_id'] = client_id
        req.params['client_secret'] = client_secret
        req.params['q'] = params[:query]
     end

          body = JSON.parse(@resp.body)
          if @resp.success?
            @repos = body["items"]

          else
            @error = "errors! oh my" #body["meta"]["errorDetail"]
          end
       render 'search'
   end

 end


#  https://blog.phusion.nl/2017/10/13/why-ruby-app-servers-break-on-macos-high-sierra-and-what-can-be-done-about-it/






