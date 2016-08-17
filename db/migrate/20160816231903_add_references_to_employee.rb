class AddReferencesToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :references, :text
    add_column :employees, :experience, :text
  end
end
