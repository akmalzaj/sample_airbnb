class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :properties
  has_many :bookings

  validates :email, uniqueness: true

  def self.authenticate(email, password)
    @user = User.find_by_email(email)

    return false if @user.nil? # nil? → true; Only the object nil responds true to nil?.
    if @user.password == password
      return @user
    else
      return false
    end
  end
end
