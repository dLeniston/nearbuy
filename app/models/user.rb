    class User < ActiveRecord::Base
    before_save do |user| 
              user.email = email.downcase 
            user.remember_token = SecureRandom.urlsafe_base64
            end
      validates :name, presence: true, length: { in: 9..30 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true, 
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }

      validates :password, presence: true, length: { minimum: 6 }
      validates :password_confirmation, presence: true
      has_secure_password
    end  