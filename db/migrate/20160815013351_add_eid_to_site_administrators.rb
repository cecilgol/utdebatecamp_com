class AddEidToSiteAdministrators < ActiveRecord::Migration[5.0]
  def change
    add_column :site_administrators, :eid, :string
  end
end
