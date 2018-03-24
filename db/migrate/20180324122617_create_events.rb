class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :capacity
      t.datetime :starting_date
      t.datetime :ending_date
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
