
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = '473981f33528aef83e2a'
      req.params['client_secret'] = '6bd6a6bedcbf38bd4c5c1fbb8b9e934be3adbae2'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    @items = body["items"]
    render 'search'
  end
end


#
# [{"id"=>76954504,
#   "node_id"=>"MDEwOlJlcG9zaXRvcnk3Njk1NDUwNA==",
#    "name"=>"react-tetris",
#     "full_name"=>"chvin/react-tetris",
#     "private"=>false, "owner"=>{"login"=>"chvin", "id"=>5383506,
#       "node_id"=>"MDQ6VXNlcjUzODM1MDY=", "avatar_url"=>"https://avatars2.githubusercontent.com/u/5383506?v=4", "gravatar_id"=>"", "url"=>"https://api.github.com/users/chvin", "html_url"=>"https://github.com/chvin", "followers_url"=>"https://api.github.com/users/chvin/followers", "following_url"=>"https://api.github.com/users/chvin/following{/other_user}", "gists_url"=>"https://api.github.com/users/chvin/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/chvin/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/chvin/subscriptions", "organizations_url"=>"https://api.github.com/users/chvin/orgs", "repos_url"=>"https://api.github.com/users/chvin/repos", "events_url"=>"https://api.github.com/users/chvin/events{/privacy}", "received_events_url"=>"https://api.github.com/users/chvin/received_events", "type"=>"User", "site_admin"=>false}, "html_url"=>"https://github.com/chvin/react-tetris", "description"=>"Use React, Redux, Immutable
