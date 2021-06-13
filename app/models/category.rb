class Category < ApplicationRecord
  validates :name, presence: true,length: { minimum: 4, maximum: 36 }
  validates_uniqueness_of :name
end