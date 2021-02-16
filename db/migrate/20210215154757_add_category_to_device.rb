class AddCategoryToDevice < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :category, :string
  end
end
