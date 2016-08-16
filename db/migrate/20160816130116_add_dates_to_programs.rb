class AddDatesToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :start_date, :date
    add_column :programs, :end_date, :date
  end
end
