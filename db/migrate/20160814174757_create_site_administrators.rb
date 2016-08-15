class CreateSiteAdministrators < ActiveRecord::Migration[5.0]
  def change
    create_table :site_administrators do |t|
      t.references :account, foreign_key: true
      t.datetime :promoted_at, null: false

      t.timestamps
    end
  end
end
