class Booking < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :properties
  belongs_to :user
end
