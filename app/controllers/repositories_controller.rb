class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "DDPVL0XWRYFIBMZMZC1PUOFMRKAIKYDS0JNHTY5SBZLAMKEX"
      req.params['client_secret'] = "SRQPBMLPIFSKQTHFNHRS1Z03JO2ZOXIBGTXJ1Y4KDM4024FS"
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @results = body["items"]
    render 'search'
  end

end
