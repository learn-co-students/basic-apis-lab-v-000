module RepositoryHelper
  def repo_link(repo)
    link_to repo["html_url"], repo["html_url"]
  end
  
  def repo_name(repo)
    repo["name"]
  end
  
  def repo_description(repo)
    repo["description"]
  end
  
  def error_message(error)
    "#{error['resource']} #{error['field']} #{error['code']}"
  end
  
  def display_errors(errors)
    content_tag :div do 
      concat(content_tag :h2, "Errors")
      concat(content_tag(:ul) { 
        errors.each do |error|
          concat( content_tag :li, error_message(error) )
        end
      })
    end
    
  end
  
end
