class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.references :camp, foreign_key: true
      t.references :program, foreign_key: true
      t.jsonb :schedule

      t.timestamps
    end
    add_index :events, :schedule, using: :gin

  end
end
