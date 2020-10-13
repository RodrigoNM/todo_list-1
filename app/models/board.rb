class Board < ApplicationRecord
  has_many :tasks
  validates_associated :tasks
  validates :title, presence: { message: "can't be blank"} 
  validates :title, uniqueness: { case_sensitive: false, message: "are uniquenes"} 
end
