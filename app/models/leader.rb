class Leader
  include ActiveModel::Model

  attr_accessor :name,
                :office,
                :party,
                :division,
                :twitter,
                :facebook,
                :photoUrl,
                :urls,
                :channels

  def self.all
    ObjectSpace.each_object(Leader).to_a
  end
end
