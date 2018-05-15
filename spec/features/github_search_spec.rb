require 'rails_helper'

RSpec.describe "Searching Github", type: :feature do

  it "displays the right data" do
    stubbed_request = stub_request(:get, "https://api.github.com/search/respositories?client_id=Iv1.a2184bd63ca0401b&client_secret=cbf42a5602c0cdc61d9d73356fa8f7869c4b4876&q=tetris").
       with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.15.1'}).
       to_return(:status => 200, :body => repository_response, :headers => {})

    visit '/search'
    fill_in 'query', with: "tetris"
    click_button "Search Github!"

    expect(page).to have_link("https://github.com/dtrupenn/Tetris", href: "https://github.com/dtrupenn/Tetris")
    expect(page).to have_content("Tetris")
    expect(page).to have_content("A C implementation of Tetris using Pennsim through LC4")
  end
end
