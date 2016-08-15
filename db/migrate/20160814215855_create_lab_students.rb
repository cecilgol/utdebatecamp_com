class CreateLabStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :lab_students do |t|
      t.references :lab, foreign_key: true, index: true
      t.references :student, foreign_key: true, index: true

      t.timestamps
    end
  end
end
