class AddDietToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :diet, :string
    add_column :students, :medicine_allergy, :string
    add_column :students, :commuter, :boolean
    add_column :students, :notes, :string
  end
end
