class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @results = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "e21514302a6c4adb9a3a"
      req.params['client_secret']="78b6cdc5a6d1079f7c5a7467694caf2bcce6ef30"
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
