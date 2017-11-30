class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |r| 
      r.params['client_id'] = '219458f45f217618e706'
      r.params['client_secret'] = 'd7b77e53e1f579992bb89b4b52f480bb5e761546'
      r.params['q'] = params[:query]
    end
    body = JSON.parse(@resp.body)
       if @resp.success?
         @repos = body["items"]
       #else
        #@error = body[]
      end
      render 'search'
  end
end
