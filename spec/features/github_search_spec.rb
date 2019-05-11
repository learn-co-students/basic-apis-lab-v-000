require 'rails_helper'

RSpec.describe "Searching Github", type: :feature do

  it "displays the right data" do
    stubbed_request = stub_request(:get, "https://api.github.com/search/repositories").with(query: hash_including({q: "tetris"})).to_return(body: repository_response)

    visit '/search'
    fill_in 'query', with: "tetris"
    click_button "Search Github!"

    # expect(page).to have_link("https://www.github.com/chvin/react-tetris", href: "https://www.github.com/chvin/react-tetris")
    # expect(page).to have_content("Tetris")
    # expect(page).to have_content("Use React, Redux, Immutable to code Tetris.")
  end
end
