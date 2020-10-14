require 'rails_helper'

RSpec.describe Board, type: :model do
  context "Validar titulo do post" do 
    it "ele seja valido" do
      board = Board.new(title: 'First Board')
      expect(board).to be_valid
    end
 
    it "ele não seja valido" do
      board = Board.new(title: nil)
      expect(board).to_not be_valid
    end
    it 'e retorna não pode ser um branco' do
      board = Board.new(title: nil)
      board.valid?
      expect(board.errors[:title]).to include("can't be blank")
    end
  end
end
