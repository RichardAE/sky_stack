class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string     :title, null: false, default: ''
      t.text       :text, null: false, default: ''
      t.integer    :user_id, null:false, default: 0

      t.timestamps null: false
    end
  end
end
