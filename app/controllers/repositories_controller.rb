class RepositoriesController < ApplicationController
  def search; end

  def github_search
    resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ENV['client_id']
      req.params['client_secret'] = ENV['client_secret']
      req.params['q'] = params[:query]
    end

    @repos = JSON.parse(resp.body)['items']
                 .map{ |i| { url: i['html_url'], desc: i['description'] } }
    render :search
  end
end
