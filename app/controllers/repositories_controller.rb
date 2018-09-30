class RepositoriesController < ApplicationController

  def search
  end

  def github_search
     @req = Faraday.get 'https://api.github.com/search/repositories' do |req|
          req.params['client_id'] = "Iv1.868fd4b1f7785772"
          req.params['client_secret'] = "ebe122565b5916675da12040003cad27b80dedd0"
          req.params['q'] = params['query']
      end
      body_info = JSON.parse(@req.body)
      if @req.success?
          @repos = body_info["items"]

      else
          @erros = @req.status
      end
          render 'search'
  end
end
