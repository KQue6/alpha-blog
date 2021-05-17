  class User < ApplicationRecord
    has_many :articles
    validates :username, presence: true, 
                        uniqueness: { case_senitive: false }, 
                        length: {minimum: 4, maximum:29 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_senitive: false }, 
                        length: { maximum: 109 },
                        format: { with: VALID_EMAIL_REGEX }
  end