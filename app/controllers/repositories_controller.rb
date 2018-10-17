class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @results = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "client id"
      req.params['client_secret']="client secret"
      req.params['q']= params[:query]
    end

    body_hash = JSON.parse(@results.body)
    @items = body_hash["items"]
    render 'search'

  end
end



    # expect(page).to have_link("https://github.com/dtrupenn/Tetris", href: "https://github.com/dtrupenn/Tetris")
    # expect(page).to have_content("Tetris")
    # expect(page).to have_content("A C implementation of Tetris using Pennsim through LC4")
