class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :address
      t.string :phone
      t.string :email
      t.string :name
      t.string :contact_name
      t.text :description
      t.integer :member_count
      t.integer :women_count

      t.timestamps
    end
  end
end
