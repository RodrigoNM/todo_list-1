class Task < ApplicationRecord
  belongs_to :board
  has_many :etapas

  def completed?
   !completed_at.blank?
  end
end
