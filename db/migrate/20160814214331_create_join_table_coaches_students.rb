class CreateJoinTableCoachesStudents < ActiveRecord::Migration[5.0]
  def change
    create_join_table :coaches, :students do |t|

      t.index [:student_id, :coach_id]
    end

  end
end
