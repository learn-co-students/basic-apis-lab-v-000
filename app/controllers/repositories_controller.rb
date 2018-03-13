class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '303c70dffe3dc17fc725'
        req.params['client_secret'] = '8a1198411520e1aef83dc8c30c0db6303d5d9946'
        req.params['q'] = params[:query]
      end
      body = JSON.parse(@resp.body)
        if @resp.success?
          @repos = body["items"]
        end
        render 'search'
      end
    end
