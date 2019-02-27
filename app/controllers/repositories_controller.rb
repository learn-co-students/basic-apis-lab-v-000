class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories?' do |req|
        req.params['client_id'] = 'a919551e208ffc953b5f'
        req.params['client_secret'] = '6dd6616934ddf6cbfab8ebf83ad072153dcd75be'
        req.params['q']= params[:query]

  end
      body_hash = JSON.parse(@resp.body)
      @results = body_hash["items"]
end
render :search

     end

end




#   def foursquare
#     begin
#      @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
#          req.params['client_id'] = 'ZFPLW2YP3HTXLB3XOBZBLD2T2GJVYF0KRNOOOCORRRRMY1S0
# '
#          req.params['client_secret'] = 'HQB2VK2VUCJFIHUBRNH3HJSNJGLLJJ0YZAH5JHEUXQUBX2OX'
#          req.params['v'] = '20160201'
#          req.params['near'] = params[:zipcode]
#          req.params['query'] = 'coffee shop'
#        end
#
#         body_hash = JSON.parse(@resp.body)
#        if @resp.success?
#
#          @venues = body_hash["response"]["venues"]
#        else
#          @error = body["meta"]["errorDetail"]
#        end
#      rescue Faraday::ConnectionFailed
#        @error = "There was a timeout. Please try again."
#      end
#
#      render 'search'
#    end
# end
