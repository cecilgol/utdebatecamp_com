class AddStartDateToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :start_date, :datetime
    add_column :events, :display_overview, :boolean

    # add_index :events, :start_date, where: "date(start_date)"
    execute <<-SQL
      CREATE INDEX event_start_date_idx ON events (date(start_date))
    SQL
  end
end
