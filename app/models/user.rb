  class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles, dependent: :destroy
    validates :username, presence: true, 
                        uniqueness: { case_senitive: false }, 
                        length: {minimum: 4, maximum:29 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_senitive: false }, 
                        length: { maximum: 109 },
                        format: { with: VALID_EMAIL_REGEX }
    has_secure_password
  end