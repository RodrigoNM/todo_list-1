class CreateEtapas < ActiveRecord::Migration[5.2]
  def change
    create_table :etapas do |t|
      t.string :title
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
