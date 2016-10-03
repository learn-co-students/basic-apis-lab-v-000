class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      repos = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
      end

      repo_hash = JSON.parse(repos.body)

      if repos.success?
        @repos = repo_hash['items']
      else
        @error = repo_hash['meta']['errorDetail']
      end

    rescue Faraday::ConnectionFailed, Faraday::TimeoutError
      @error = 'There was a timeout. Please try again.'
    end

    render 'search'
  end
end
