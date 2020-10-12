class Board < ApplicationRecord
  has_many :tasks
  validates :title, presence: { message: "O campo de texto não pode ficar em branco"} 
  validates :title, uniqueness: { case_sensitive: false, message: "Não pode haver mais de um board com o mesmo nome"} 
end
