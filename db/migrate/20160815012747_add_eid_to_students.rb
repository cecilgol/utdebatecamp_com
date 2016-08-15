class AddEidToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :eid, :string
  end
end
