class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :cell_phone
      t.string :other_phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :territory
      t.string :country
      t.date :birthday
      t.string :dorm
      t.string :eid
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
