class AddEidToDirectors < ActiveRecord::Migration[5.0]
  def change
    add_column :directors, :eid, :string
  end
end
