class CreateDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :directors do |t|
      t.references :account, foreign_key: true
      t.references :camp, foreign_key: true
      t.string :official_phone
      t.string :official_email

      t.timestamps
    end
  end
end
