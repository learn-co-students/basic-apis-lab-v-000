class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '07e06061be2ca0383d2f'
      req.params['client_secret'] = '08c00f9a905d24114929accb86177fe94ec3fa4d'
      req.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
    @search = body["items"]
    render 'search'
  end

end

  # def foursquare
  #   begin
  #     @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
  #       req.params['client_id'] = 'QLET55S4BRUYB3HBM4FISJF3FJT1FURB2VMXFKR0ZFFEP2UY'
  #       req.params['client_secret'] = '1B3BGI4DI3OKQAFI0AZ53UORJMUUGXIFVL10KCYCTHOBM52D'
  #       req.params['v'] = '20160201'
  #       req.params['near'] = params[:zipcode]
  #       req.params['query'] = 'coffee shop'
  #       req.options.timeout = 60
  #     end
  #     body = JSON.parse(@resp.body)
  #     if @resp.success?
  #       @venues = body["response"]["venues"]
  #     else
  #       @error = body["meta"]["errorDetail"]
  #     end

  #   rescue Faraday::TimeoutError
  #     @error = "There was a timeout. Please try again."
  #   end
  #   render 'search'
  # end

