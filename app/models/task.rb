class Task < ApplicationRecord
  belongs_to :board
  has_many :etapas
  validates :title, presence: { message: "can't be blank"} 
  def completed?
   !completed_at.blank?
  end
end
