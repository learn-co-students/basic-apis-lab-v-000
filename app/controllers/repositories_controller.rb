class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'KCPJYKE3TISAHGFWPZF0ISQ4HLJJWQ4WKA3DWHPSB5WWXJQ1'
        req.params['client_secret'] = 'TJ10GRCRH2LXDDBT2AZRRZ1FBVYKLHBZTTE3Z31XX3JLIZVT'
        req.params['q'] = 'tetris'
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @items = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end


end
