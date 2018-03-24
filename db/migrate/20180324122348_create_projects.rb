class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :women_ratio
      t.string :leader_name
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
