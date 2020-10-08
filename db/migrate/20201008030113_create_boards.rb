class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :description
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
