class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true


  has_secure_password
  def self.authenticate_with_credentials(email, password)
    @user = User.find_by email: email
    if @user && @user.authenticate(password)
      true
    else
      false
    end
  end
end
