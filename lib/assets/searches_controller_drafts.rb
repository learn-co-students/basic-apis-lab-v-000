class RepositoriesController < ApplicationController

  def search

  end
############################## 1st try ##############################
  def github_search
    id = "c8286d1b27eb8d002e10"
    secret = "84ed7f0715ea3f5f1d6cc3f2ae42b9af53a243bc"
    login_name = "smithWEBtek"

    @resp = Faraday.get "https://api.github.com/users/" do |req|
      req.method='get', 
      req.params['client_id'] = client_id,
      req.params['client_secret'] = client_secret,
      req.params['login'] = login_name
     end
 body = JSON.parse(@resp.body)
      # if @resp.success?
        @repos = body["owner"]["repositories"]
      # else
      #   @error = # error syntax for github   body["meta"]["errorDetail"]
      # end
 
    # rescue Faraday::TimeoutError
    #   @error = "There was a timeout. Please try again."
    # end
    render 'search'
  end
end

#################################  2nd try ############################

  def github_search
    id = "c8286d1b27eb8d002e10"
    secret = "84ed7f0715ea3f5f1d6cc3f2ae42b9af53a243bc"
    repo = {}
    @repos = []

    @resp = Faraday.get "https://api.github.com/users/'#{params[:query]}'/repos?client_id'#{id}'&client_secret'#{secret}'" do |req| 
    
binding.pry

    @bodies = JSON.parse(@resp.body)
    end
 
    @bodies.each do |body|
      repo = {
        owner: body[0]["owner"]["login"],
        url: body[0]["owner"]["url"],
        description: body[0]["description"]
      }
      end
    @repos.push(repo)
binding.pry
    render 'search'
  end
end

#########################   3rd try ####################################
# Failure/Error: @resp = Faraday.get "https://api.github.com/users/#{login}/repos?client_id#{id}&client_secret#{secret}" do |req|
     
     # WebMock::NetConnectNotAllowedError:
       # Real HTTP connections are disabled. Unregistered request: GET https://api.github.com/users/tetris/repos?client_idc8286d1b27eb8d002e10&client_secret84ed7f0715ea3f5f1d6cc3f2ae42b9af53a243bc with headers {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.11.0'}
       
class RepositoriesController < ApplicationController

  def search
  end

  def github_search
    id = "c8286d1b27eb8d002e10"
    secret = "84ed7f0715ea3f5f1d6cc3f2ae42b9af53a243bc"
    login = params[:query]
    repo = {}
    @repos = []

    @resp = Faraday.get "https://api.github.com/users/#{login}/repos?client_id#{id}&client_secret#{secret}" do |req| 
      end
    @bodies = JSON.parse(@resp.body)
    @bodies.each do |body|
      repo = {
        owner: body["owner"]["login"],
        name: body["name"],
        url: body["html_url"],
        description: body["description"]
      }
    @repos.push(repo)
    end 

    render 'search'
  end
end













#####