class AddBlurbsToCamp < ActiveRecord::Migration[5.0]
  def change
    add_column :camps, :info_blurb, :string
    add_column :camps, :staff_blurb, :string
  end
end
