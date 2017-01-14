class CreateJoinTableParentsStudents < ActiveRecord::Migration[5.0]
  def change
    create_join_table :parents, :students do |t|

      t.index [:student_id, :parent_id]
    end
  end
end
