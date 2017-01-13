class AddObliqueToCamp < ActiveRecord::Migration[5.0]
  def up
    enable_extension :hstore
  end

  def down
    disable_extension :hstore
  end

  def change
    add_column :camps, :oblique, :hstore
    add_index :camps, :oblique, using: :gin
  end
end
