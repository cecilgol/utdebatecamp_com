class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.references :camp, foreign_key: true
      t.string :name
      t.string :nickname
      t.text :info

      t.timestamps
    end
  end
end
