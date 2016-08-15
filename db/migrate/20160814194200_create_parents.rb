class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.references :account, foreign_key: true, index: true
      t.integer :added_by_id
      t.string :preferred_contact_method

      t.timestamps
    end
  end
end
