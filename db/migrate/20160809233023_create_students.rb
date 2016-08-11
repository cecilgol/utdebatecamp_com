class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.belongs_to :camp, foreign_key: true
      t.belongs_to :account, foreign_key: true
      t.string :gender
      t.string :pronouns
      t.string :dorm
      t.string :high_school
      t.date :arrival_date
      t.date :leave_date
      t.string :arrival_means
      t.string :leave_means

      t.timestamps
    end
  end
end
