class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    #binding.pry
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      #req.params['client_id'] = 'YIPEKBWE4DNCUJ2PQ2RC3KXK3DTWKCRRAMTJGKM4PMPZ5HIZ'
      #req.params['client_secret'] = 'R4XGWEYWATXNGA3MR52Y1HRBOJ4WR340STLGINBLNON5PDM4'
      #req.params['v'] = '20160201'
      req.params['q'] = params[:query]
    end
    @body = JSON.parse(@resp.body)
    @items = @body["items"]
    #binding.pry
    #if @resp.success?
    #  @venues = body["response"]["venues"]
    #else
    #  @error = body["meta"]["errorDetail"]
    #end

    #rescue Faraday::ConnectionFailed
    #  @error = "There was a timeout. Please try again."
    #end
    render 'search'
  end
  
end
