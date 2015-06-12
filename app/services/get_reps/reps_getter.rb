require 'net/http'

class RepsGetter
  attr_accessor :address, :hash, :leaders
  def initialize(address)
    @address = address
    @hash = self.api_call
    @leaders = self.create_leaders
    self.assign_offices
  end
  
  def get
    @leaders
  end

  def create_leaders
    leaders = []
    reps = @hash["officials"]

    reps.each do |rep|
      leaders << Leader.new(white_list(rep))
    end
    leaders
  end
  
  def assign_offices
    offices = @hash["offices"]
    @leaders.each_with_index do |leader, i|
      leader.office = offices[i]
    end
  end

  def white_list(params)
    params.except("address", "phones", "emails")
  end

  def offices
    list = []
    offices = @hash["offices"]
    offices.each do |office|
      office["officialIndices"].each do |index|
        list << office["name"]
      end
    end
    list
  end

  def api_call
    key = ENV["GOOGLE_API_KEY"]
    uri = URI("https://www.googleapis.com/civicinfo/v2/representatives")
    uri.query = URI.encode_www_form(
      {
        address: @address,
        key: key
      }
    )
    res = Net::HTTP.get_response(uri) 
    JSON.parse res.body
  end
end
