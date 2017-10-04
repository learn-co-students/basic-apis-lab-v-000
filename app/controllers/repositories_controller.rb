class RepositoriesController < ApplicationController

  def search
    

  end

  def github_search
    
    resp = Faraday.get "https://api.github.com/search/repositories?access_token=6dd05852697afbb8b52d7d95955f383606a994b0&q=#{params['query']}"
    if resp.success?
      repos = JSON.parse(resp.body)
      @found_repos = []
      repos["items"].each do |repo|
        new_repo = {name: repo["name"] ,description: repo["description"], url: repo["html_url"]}
        @found_repos << new_repo
      end
    end
    render :search
  end
  
  end
