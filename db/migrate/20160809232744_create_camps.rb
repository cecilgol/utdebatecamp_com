class CreateCamps < ActiveRecord::Migration[5.0]
  def change
    create_table :camps do |t|
      t.string :name
      t.string :nickname
      t.text :info
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
