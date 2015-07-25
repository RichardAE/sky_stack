class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text    :text, null: false, default: ''
      t.integer :question_id, null: false, default: ''
      t.integer :user_id, null: false, default: ''

      t.timestamps null: false
    end
  end
end
