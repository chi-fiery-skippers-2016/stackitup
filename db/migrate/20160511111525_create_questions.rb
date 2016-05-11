class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null:false, unique:true
      t.string :body, null:false
      t.integer :author_id, null:false
      t.integer :view_count, default: 0
      t.integer :score, default: 0

      t.timestamps null:false
    end
  end
end
