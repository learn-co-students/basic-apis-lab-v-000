class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '32f1dd0de276db6dbe07'
    client_secret = 'e2dac4d284a8f5421ead125037c089006cb029f1'

    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
     if @resp.success?
       @repositories = body["items"]
     else
       @error = body["message"]
     end
     
     render :search
  end
end
