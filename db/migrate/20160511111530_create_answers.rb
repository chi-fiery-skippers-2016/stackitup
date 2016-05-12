class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null:false
      t.integer :question_id, null:false
      t.integer :theOneWhoAnswers_id, null:false
      t.boolean :best?
      t.integer :score, default: 0

      t.timestamps null:false
    end
  end
end
