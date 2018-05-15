require 'rails_helper'

RSpec.describe RepositoriesController, type: :controller do

  describe "github_search" do

    it "makes a request to github" do
      stubbed_request = stub_request(:get, "https://api.github.com/search/respositories?client_id=Iv1.a2184bd63ca0401b&client_secret=cbf42a5602c0cdc61d9d73356fa8f7869c4b4876&q=tetris").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.15.1'}).
         to_return(:status => 200, :body => repository_response, :headers => {})
      post 'github_search', query: "tetris"
      expect(stubbed_request).to have_been_requested
      expect(response).to render_template('search')
    end
  end
end
