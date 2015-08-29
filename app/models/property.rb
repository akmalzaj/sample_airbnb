class Property < ActiveRecord::Base
  # Remember to create a migration!
  has_many :bookings
  has_many :property_tags
  has_many :tags, through: :property_tags
  belongs_to :user
end
