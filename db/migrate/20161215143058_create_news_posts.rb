class CreateNewsPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :news_posts do |t|
      t.string :title
      t.string :body
      t.references :account, foreign_key: true
      t.boolean :published

      t.timestamps
    end
  end
end
