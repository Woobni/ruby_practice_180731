class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :post_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
