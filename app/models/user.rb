class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email, presence: true
  validates :password, presence: true


  has_secure_password
  def self.authenticate_with_credentials(email, password)
    @user = User.find_by email: email.downcase
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
