class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true, confirmation: true
  validates :password, :length => {
    :minimum => 6,
    :too_short => 'must be 6 characters'
  }, :on => :create

  def authenticate_with_credentials(email, password)
    

    user = User.find_by_email(email.strip.downcase)
    
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end


end
