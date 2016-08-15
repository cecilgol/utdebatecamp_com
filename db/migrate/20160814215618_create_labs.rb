class CreateLabs < ActiveRecord::Migration[5.0]
  def change
    create_table :labs do |t|
      t.references :program, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :session

      t.timestamps
    end
  end
end
