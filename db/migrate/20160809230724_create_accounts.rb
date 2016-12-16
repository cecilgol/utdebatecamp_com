class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.string :cell_phone, null: false
      t.string :other_phone
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :city, null: false
      t.string :state
      t.string :territory
      t.string :country, default: "US"
      t.date :birthday
      t.string :eid
      t.belongs_to :user, foreign_key: true
      t.references :accountable, polymorphic: true

      t.timestamps
    end
  end
end
