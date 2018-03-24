class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.string :feedback_title
      t.text :feedback_content
      t.references :institution, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
