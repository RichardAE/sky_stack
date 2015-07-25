class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :text, null: false, default: ''
      t.integer :commentable_id, null: false, default: 0
      t.string  :commentable_type, null: false, default: ''
      t.integer :user_id, null: false, default: 0

      t.timestamps null: false
    end
  end
end
