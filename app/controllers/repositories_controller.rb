class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = "19b3de9fb7b6bafe8c3d"
        req.params['client_secret'] = "7eb1899cba01276c45a88d804d738a1ff07b27bb"
        #req.params['state'] = ('a'..'z').to_a.shuffle[0, 8].join
        req.params['q'] = params[:query]
        req.params['redirect_uri'] = 'http://localhost:3000/search'
    end
    body = JSON.parse(@resp.body)
    if @resp.success?
      @items = body["items"] #["response"]["items"]
    else
      @error = body
    end


    rescue Faraday::TimeoutError
      @error = "There was a timeout. Please try again."
    end
    render 'search'
  end

private

  def get_id
    @id = "19b3de9fb7b6bafe8c3d"
  end

  def get_secret
    @secret = "7eb1899cba01276c45a88d804d738a1ff07b27bb"
  end

end


#<%= item["description"] %><br>
      #<%= item["owner"]["html_url"] %>
  #    <!--   <ul>
  #   <% @items.each #do |item| %>
  #   <li> 
  #     <%= item.to_arr %><br>
      
  #   </li> 
  #   <% #end %>
  # </ul> -->