require "tb/version"

class Tb
  def initialize(api_token)
    @api_token = api_token
  end
  
  def headers
    {
      "Authorization" => "Token token=\"#{@api_token}\""
    }
  end
  
  def api_address
    "http://66.228.40.130/api"
  end
  
  def contacts(page = 1)
    RestClient.get "#{api_address}/contacts?page=#{page}", headers
  end
  
  def add_contacts(contacts = [])
    details = {
      "contacts[]" => contacts
    }
    
    RestClient.post "#{api_address}/contacts", details, headers
  end
end