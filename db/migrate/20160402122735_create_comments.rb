class CreateComments < ActiveRecord::Migration
  drop_table :comments
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
