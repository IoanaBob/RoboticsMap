class AddCategoryToInstitution < ActiveRecord::Migration[5.1]
  def change
    add_column :institutions, :category_id, :integer
    add_foreign_key :institutions, :categories
  end
end
