class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.references :account, foreign_key: true
      t.string :school_name
      t.string :school_state
      t.string :school_phone
      t.integer :added_by_id

      t.timestamps
    end
  end
end
