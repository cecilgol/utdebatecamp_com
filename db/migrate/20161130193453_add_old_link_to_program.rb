class AddOldLinkToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :old_link, :string
  end
end
