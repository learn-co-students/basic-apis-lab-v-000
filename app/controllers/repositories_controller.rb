class RepositoriesController < ApplicationController

  def search

  end

  def github_search

    begin
      @repo = Faraday.get 'https://api.github.com/search/repositories' do |req|
        #  for the client_id and Client_secret, you are expect to put the real
        # client_Id and client_secret into the code...
        req.params['Iv1.bc97934ad1af1949'] = 'Iv1.bc97934ad1af1949' 
        req.params['e7b6191c077586b201abb6c9820326c5ba7ce4af'] = 'e7b6191c077586b201abb6c9820326c5ba7ce4af'
        req.params['v'] = '20160201'
        req.params['name'] = params[:name]
        req.params['link'] = 'url'
     end
       render 'search'
     end

    end



end


# App ID: 25363

# Client ID: Iv1.bc97934ad1af1949

# Client secret: e7b6191c077586b201abb6c9820326c5ba7ce4af