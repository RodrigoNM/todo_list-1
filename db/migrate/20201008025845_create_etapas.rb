class CreateEtapas < ActiveRecord::Migration[5.2]
  def change
    create_table :etapas do |t|
      t.string :description

      t.timestamps
    end
  end
end
