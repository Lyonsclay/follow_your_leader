class Leader
  include ActiveModel::Model

  attr_accessor :name,
                 :office,
                 :party,
                 :division,
                 :twitter,
                 :facebook,
                 :photo
  def self.all
    ObjectSpace.each_object(Leader).to_a
  end

  def get_reps(address)
    key = ENV["GOOGLE_API_KEY"]
    uri = URI( "https://www.googleapis.com/civicinfo/v2/representatives")
    uri.query = URI.encode_www_form({
      address: address,
      key: key
    })
    res = Net::HTTP.get_response(uri) 
    @hash = JSON.parse res.body
  end

  private

  def expand_offices

  end

  def create_leaders

  end
end
