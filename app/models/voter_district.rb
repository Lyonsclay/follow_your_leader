class VoterDistrict
  include ActiveModel::Model

  attr_accessor(
    :address,
    :latitude,
    :longitude
  )

  validates :address, presence: true
end
