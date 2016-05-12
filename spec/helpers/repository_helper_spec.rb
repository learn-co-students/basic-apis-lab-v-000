require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RepositoryHelper. For example:
#
# describe RepositoryHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RepositoryHelper, type: :helper do
  let!(:error) {
    JSON.parse('
      {"resource": "Search",
      "field": "q",
      "code": "missing"}
    ')
  }
  describe '#error_message' do 
    it "displays the error message in a readable format" do
      expect(helper.error_message(error)).to eq("Search q missing")
    end
  end
end
