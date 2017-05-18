class CreateEmergencyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :emergency_contacts, id: false do |t|
      t.references :student, foreign_key: true
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
