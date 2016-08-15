class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :camp, foreign_key: true
      t.references :program, foreign_key: true
      t.references :account, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :title
      t.date :arrival_date
      t.date :leave_date
      t.text :bio
      t.string :pronouns
      t.string :dorm
      t.string :eid

      t.timestamps
    end
  end
end
