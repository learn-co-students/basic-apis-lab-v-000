class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.2acf3792c7330215'
        req.params['client_secret'] = '1ff85245b6b40da6707cb94929e6a75ced613327'
        req.params['q'] = params[:query]
      end


      body = JSON.parse(@resp.body)
      
      if @resp.success?
        @urls = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again"
    end
    render 'search'
  end
end
